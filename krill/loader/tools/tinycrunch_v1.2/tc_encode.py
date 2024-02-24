#!/usr/bin/env python
from __future__ import division, print_function
from math import log
from collections import defaultdict
import itertools
import os
import sys
boot_path=os.path.join(os.path.dirname(os.path.abspath(__file__)), "tc_boot.prg")
__version__ = "1.2.0"

inf=float('Inf')  # importing inf from math only works under python 3 :-/


def load_prg(fi):
    data = list(bytearray(fi.read()))
    addr = data[0] + 256 * int(data[1])
    return CDataChunk(addr, data[2:])

def save_prg(fo, data_chunk):
    fo.write(bytearray([data_chunk.addr&255,data_chunk.addr>>8]+data_chunk.data))


class CDataChunk:
    def __init__(self, addr, data, se=None):
        self.addr=addr
        self.data=data
        self.se=se # source extent description. Doubles as a marker that this data has been compressed

    @classmethod
    def ending_at(cls, ea, data, se=None):
        return CDataChunk(ea-len(data), data, se)

    def end_addr(self):
        return self.addr+len(self.data)

    def ext(self):
        return "0x{:04x}-0x{:04x}".format(self.addr,self.end_addr())

    def split_at(self,addr):
        assert(self.addr<=addr)
        assert(addr<=self.end_addr())
        sp=addr-self.addr
        lower=CDataChunk(self.addr, self.data[:sp])
        upper=CDataChunk(addr, self.data[sp:])
        return lower,upper

    def extend(self, addend):
        assert(self.end_addr()==addend.addr)
        self.data.extend(addend.data)


class CCruncher:
    def __init__(self, greedy=False):
        self.longestCopy    =   17
        self.maxPairOffset  =   63
        self.maxOffset      = 2048
        self.longestLiteral =   64
        self.greedy = greedy
        self.reset_stats()

    def reset_stats(self):
        self.stats = CCruncher.Stats()

    def crunch(self, input_chunk, inPlace=False):
        self.inPlace = inPlace
        self.output_bytes = [0, 0, 0]  # leave space for target address, and final byte

        self.input_chunk = input_chunk
        self.data = input_chunk.data[:-1]
        self.remainder = input_chunk.data[-1:]
        if len(self.data)==0:
            return self.output_token_list([])

        if self.greedy:
            return self.crunch_greedy()
        else:
            return self.crunch_optimal()


    def encode_literal(self, literal):
        "10xxxxxx"
        assert (0 < len(literal) <= 64)
        return [128 + len(literal) - 1, ] + literal[:]

    def encode_copy(self, length, offset):
        assert (1 < length <= self.longestCopy)
        if length == 2 and offset <= self.maxPairOffset:
            "11oooooo"
            assert (offset < 64)
            return [(0xc0 + offset) ^ 63, ]  # ie, offset^0x7f
        else:
            "0aaaaabb bbbbbbbb"
            # bits 1.5.10
            # assert(2<= length<32)
            assert(0<offset<=2048)
            offset=offset-1
            return [
                0x00 + (((offset & 0x700) >> 8) ^ 7) + ((length - 2) << 3),
                (offset & 0xff) ^ 0xff
            ]

    def crunch_greedy(self):
        # just finds for any point the string that extends the furthest

        longestCopy = self.longestCopy
        maxOffset = self.maxOffset
        tokens = []
        self.literals = []

        def tokenise_literal_if_present():
            if len(self.literals) > 0:
                tokens.append(
                    self.OptToken(0, self.encode_literal(self.literals), 0, length=len(self.literals), offset=0))
                self.literals = []

        data = self.data
        l = len(data)
        nj = 0
        last_seen = defaultdict(lambda: -(2 ** 17))
        for j in range(l):
            kl = [tuple(data[j:j + i]) for i in range(longestCopy + 1) if j + i <= l]

            if j == nj:
                length = len(kl) - 1
                while length > 1:
                    offset = j - last_seen[kl[length]]
                    if offset < maxOffset:
                        token = self.encode_copy(length, offset)
                        if token[0] != 0:
                            tokenise_literal_if_present()
                            assert (offset > 0)
                            tokens.append(self.OptToken(0, token, 0, length=length, offset=offset))
                            nj = j + length
                            break
                    length -= 1
                else:
                    self.literals.append(data[j])
                    if len(self.literals) == self.longestLiteral:
                        tokenise_literal_if_present()
                    nj = j + 1

            for k in kl[1:]:
                last_seen[k] = j
        tokenise_literal_if_present()
        return self.output_token_list(tokens)


    class OptToken:
        def __init__(self, cost, data, next, length, offset):
            self.cost = cost
            self.data = data
            self.next = next
            self.length = length
            self.offset = offset

        def __repr__(self):
            if len(self.data) < 5:
                dr = " ".join(['{:02x}'.format(j) for j in self.data])
            else:
                dr = "{} bytes".format(len(self.data))
            return "OptToken({},[{}],{},{},{})".format(self.cost, dr, self.next, self.length, self.offset)

    def crunch_optimal(self):

        longestCopy    = self.longestCopy
        maxPairOffset  = self.maxPairOffset
        maxOffset      = self.maxOffset
        longestLiteral = self.longestLiteral
        data = self.data

        l = len(data)
        last_seen = defaultdict(lambda: -(2 ** 17))  # address key was last seen starting at

        # cfile[j] contains the tail of a list that in turn contains the
        # cheapest representation of the first j bytes of the file
        # data containst the bytes that must be added to the stream to
        # cover the bytes between that token and its predecessor
        cfile = [self.OptToken(0, None, None, 0, 0)]
        best = None

        for j in range(1, l + 1):
            copy_candidates = [tuple(data[j - i:j]) for i in range(2, longestCopy + 1) if
                               j - i >= 0]  # find all the tuples that end at this point
            best = self.OptToken(inf, None, None, 0, 0)

            for k in copy_candidates:
                mra = last_seen[k]
                length = len(k)
                start_addr = j - length
                assert (length > 1)
                offset = j - mra
                if offset < maxOffset:
                    nb = [1.01, 2.012][length > 2 or offset > maxPairOffset]
                    cost = cfile[start_addr].cost + nb
                    if cost < best.cost:
                        token = self.encode_copy(length, offset)
                        if token[0] != 0:
                            best = self.OptToken(cost, token, start_addr, length=length, offset=offset)
                            assert ((mra - length) < j)

            for length in range(1, longestLiteral + 1):
                start_addr = j - length
                if start_addr >= 0:
                    cost = cfile[start_addr].cost + length + 1.01
                    if cost < best.cost:
                        literal = data[start_addr:j]
                        best = self.OptToken(cost, self.encode_literal(literal), start_addr, length=len(literal),
                                             offset=0)
                        assert (len(best.data) == length + 1)
                        assert (start_addr < j)

            cfile.append(best)
            for k in copy_candidates:
                last_seen[k] = j

        assert best is not None
        tokens = [best]
        while best.next != 0:
            best = cfile[best.next]
            tokens.append(best)
        tokens.reverse()
        return self.output_token_list(tokens)

    def output_token_list(self, tokens):
        j = len(tokens)
        watermark = j  # from here on, just store raw data
        if self.inPlace:
            # Scan the token list from the end back.
            # Whenever compressed remainder is equal or longer in length to raw remainder,
            # set that token to start of raw data.
            raw_bytes_after_token_j = 0
            comp_bytes_after_token_j = 0
            raw_bytes_after_watermark = 0
            while j > 0:
                j -= 1
                raw_bytes_after_token_j += tokens[j].length
                comp_bytes_after_token_j += len(tokens[j].data)
                if raw_bytes_after_token_j <= comp_bytes_after_token_j:
                    watermark = j
                    raw_bytes_after_watermark += raw_bytes_after_token_j
                    raw_bytes_after_token_j = 0
                    comp_bytes_after_token_j = 0

        for t in tokens[:watermark]:
            self.stats.log_token(t)
        self.output_bytes.extend(itertools.chain.from_iterable(x.data for x in tokens[:watermark]))
        if self.inPlace and raw_bytes_after_watermark > 0:
            self.remainder = self.data[-raw_bytes_after_watermark:] + self.remainder
        if len(self.remainder)>1:
            self.stats.log_raw(len(self.remainder)-1)

        self.stats.log_header(3)
        self.stats.log_move(1)
        self.output_bytes[0] = self.remainder[0]
        self.output_bytes[1] = (self.input_chunk.addr - 1) % 256
        self.output_bytes[2] = (self.input_chunk.addr - 1) // 256
        self.stats.log_terminator()
        self.remainder[0] = 0  # terminator for compressed data
        self.output_bytes.extend(self.remainder)
        self.remainder = None
        return self.output_bytes

    def report(self, raw=False):
        self.stats.report(raw=raw)


    class Stats:
        class StatCounter:
            def __init__(self, legend):
                self.legend=legend
                self.reset()
            def reset(self):
                self.ct=0
                self.bi=0
                self.bo=0
            def acc(self, ct=1, bi=0, bo=0):
                self.ct+=ct
                self.bi+=bi
                self.bo+=bo
            def cost(self):
                return max(0,self.bo-self.bi)
            def savings(self):
                return max(0,self.bi-self.bo)
            def print(self, fs, ent, ifp):
                l_c=self.ct
                l_o=self.bo
                l_i=self.bi
                if l_c>0: print(fs.format(self.legend, l_c, ent(l_c), ifp(l_i), ifp(l_o - l_i), ifp(l_i-l_o), ifp(l_o), ))
        def __init__(self):
            self.rs = ""
            self.counts={
                    'pair':self.StatCounter('2 byte copies'),
                    'copy':self.StatCounter('n byte copies'),
                    'literal':self.StatCounter('literal strings'),
                    'header':self.StatCounter('segment headers'),
                    'move':self.StatCounter('moved to header'),
                    'gap':self.StatCounter('gaps'),
                    'boot':self.StatCounter('boot'),
                    'raw':self.StatCounter('uncompressed'),
                    'end':self.StatCounter('terminators'),
                    'load':self.StatCounter('load address'),
                    'save':self.StatCounter('save address'),
                    }
            self.offsets = []
            self.litlens = []

        def log_token(self, t):
            dl = len(t.data)
            if t.offset == 0:
                self.log_literal(t.length, dl)
            elif dl == 1:
                self.log_pair(t.offset, dl)
            else:
                self.log_copy(t.length, t.offset, dl)

        def log_pair(self, offset, dl):
            self.offsets.append(offset)
            self.rs += '!'
            self.counts['pair'].acc(bi=2, bo=dl)
            assert (dl == 1)

        def log_copy(self, length, offset, dl):
            self.offsets.append(offset)
            self.rs += '@'
            self.counts['copy'].acc(bi=length, bo=dl)
            assert (dl == 2)

        def log_literal(self, length, dl):
            self.litlens.append(length)
            self.rs += '.'
            assert (dl == 1 + length)
            self.counts['literal'].acc(bi=length, bo=dl)

        def log_boot(self,   length): self.counts['boot'].acc(bo=length)
        def log_gap(self,    length): self.counts['gap'].acc(bo=length)
        def log_header(self, length): self.counts['header'].acc(bo=length)
        def log_move(self,   length): self.counts['move'].acc(bi=length)
        def log_raw(self,    length): self.counts['raw'].acc(bi=length, bo=length)
        def log_terminator(self    ): self.counts['end'].acc(bo=1)
        def log_load_addr(self     ): self.counts['load'].acc(bi=2,ct=1)
        def log_save_addr(self     ): self.counts['save'].acc(bo=2)

        def report(self, raw=False):
            # print(self.rs)
            g1= "copy pair literal end".split()
            g2= "move load save boot header gap raw".split()

            if raw:
                for k in g2: self.counts[k].reset()

            symcount = sum(self.counts[k].ct for k in g1)
            vi=self.counts.values

            s_c = sum(c.ct for c in vi())
            s_i = sum(c.bi for c in vi())
            cost = sum(c.cost() for c in vi())
            savings = sum(c.savings() for c in vi())
            s_o = sum(c.bo for c in vi())
            assert (s_i + cost - savings == s_o)

            ent = lambda x: ["n/a", "{:7.3f}".format(log((x + 1e-20) / (symcount + 1e-20)) / log(0.5))][x > 0]
            noent= lambda x: ""
            ifp = lambda x: ["", x][x > 0]
            hr = "+-----------------+------------------+----------------------------------+"
            fs = "|{:>16} | {:>7} {:>7}  |  {:>7} {:>7} {:>7} {:>7} |"
            print()
            print(hr)
            print(fs.format("", "count", "entropy", "input", "cost", "savings", "output", ))
            print(hr)
            for k in g1: self.counts[k].print(fs, ent, ifp)
            print(hr)
            if not raw:
                for k in g2: self.counts[k].print(fs, noent, ifp)
                print(hr)
            print(fs.format("total", s_c, "", s_i, cost, savings, s_o, ))
            print(hr)


            self.offsets.sort()
            if len(self.offsets):
                print("median, maximum offset used = {:}, {:}".format(self.offsets[len(self.offsets) // 2], self.offsets[-1]))
            self.litlens.sort()
            if len(self.litlens):
                print("median, maximum litlen used = {:}, {:}".format(self.litlens[len(self.litlens) // 2],
                                                                self.litlens[-5:]))
            print()


if __name__ == "__main__":
    import argparse

    def hi(x):
        return x//256
    def lo(x):
        return x&255
    def parse_args():
        def hex(x):
            return x and int(x, 16)

        parser = argparse.ArgumentParser(prog='python '+os.path.basename(sys.argv[0]))
        parser.add_argument('-V', '--version', action='version',
                    version='%(prog)s {version}'.format(version=__version__))
        parser.add_argument('infile', type=argparse.FileType('rb'), help="(.prg file unless -r is used)")
        parser.add_argument('outfile', type=argparse.FileType('wb'), help="(.prg file unless -r is used)")

        group = parser.add_mutually_exclusive_group(required=True)
        group.add_argument("-s", "--startAddress", dest="startAddr", help="start address", default=None, type=hex)
        group.add_argument("-e", "--endAddress", dest="endAddr", help="end address", default=None, type=hex)
        group.add_argument("-i", "--inPlace", dest="inPlace", help="compress to end of destination area",
                           action="store_true")
        group.add_argument("-x", "--selfExtracting", action="store_true")
        group.add_argument("-r", "--raw", action="store_true", help="read/write .bin files, no header. cf readme.txt")
        parser.add_argument("-j", "--jmp", dest="execAddr", help="execution address for self extracting .prg (requires -x)", default=0x080d, type=hex)

        parser.add_argument("-p", "--paramFile", type=argparse.FileType('w'), default=None, help="generated asm include file containing a define for the output start address")
        parser.add_argument("-v", "--verbose", action="store_true")
        parser.add_argument("-f", "--fast", action="store_true",
                            help="faster (greedy) compression (default is optimal size)")
        return parser.parse_args()

    def level_crunch(args, op, input_chunk):
        output_bytes = op.crunch(input_chunk, args.inPlace)

        if args.inPlace:
            la = input_chunk.end_addr() - len(output_bytes)
        elif args.endAddr is not None:
            la = args.endAddr - len(output_bytes)
        else:
            la = args.startAddr

        output_chunk=CDataChunk(la, output_bytes)

        if args.paramFile:
            print("dcSrc=$%04x" % (output_chunk.addr,), file=args.paramFile)
            args.paramFile.close()

        return output_chunk


    def raw_crunch(args, op, input_data):
        assert not args.inPlace, "--inPlace makes no sense for raw mode"
        assert not args.paramFile, "cannot generate paramFile for raw mode"
        input_chunk = CDataChunk(0, input_data+[0,])  #add fake load address, and dummy byte-to-move-to-header
        output_bytes = op.crunch(input_chunk, False)
        return output_bytes[3:]  #drop header


    def sfx_crunch(args, op, input_chunk):
        """
            compresses the input file in two segments.
            The first contains a compressed copy of the data
            to be decrunched to the area after the loaded file
            The second contains the remaining data,
            compressed in place.

            It takes an iteration or three to find the optimal split point
        """

        def dprint(*prargs):
            if args.verbose:
                print(*prargs)

        def disp_chunks(chunks):
            for chunk in chunks:
                if chunk.se is None:
                    dprint("data segment at {}, uncompressed".format(chunk.ext()))
                else:
                    dprint("data segment at {}, decrunches to {}".format(chunk.ext(), chunk.se))

        dprint()
        dprint("       input at {}".format( input_chunk.ext()))

        boot_chunk = load_prg(open(boot_path,'rb'))
        output_chunk, offsets=boot_chunk.split_at(boot_chunk.end_addr()-3)

        patch_offsets = offsets.data
        o_start = patch_offsets[2]

        dprint("        boot at {}".format(output_chunk.ext()))

        data_start = output_chunk.end_addr()
        monolith=CDataChunk(data_start, op.crunch(input_chunk, False), input_chunk.ext())
        monolith_stats=op.stats

        dprint("    monolith at {}".format( monolith.ext()))

        if input_chunk.addr>=monolith.end_addr() or input_chunk.end_addr()<=monolith.addr:
            dprint("(doesn't overlap output, using as is)")
            chunks=[monolith,]  #this is safe because it doesn't overlap the input chunk
        else:
            split_point=min(monolith.end_addr()+12, input_chunk.end_addr()-1)  #assume compression is slightly worse
            max_gap=len(input_chunk.data)//2000 # try for 0.05% bytes wasted between output segments
            while 1:
                op.reset_stats()
                if split_point>=input_chunk.end_addr():
                    dprint("\nnew split point of 0x{:04x} is past end of input.".format(split_point))
                    split_point = data_start

                    if input_chunk.addr<data_start:
                        dprint("Storing from 0x{:04x} to end of input uncompressed, followed by compressed first part.".format(split_point))
                        lower_chunk, upper_chunk = input_chunk.split_at(split_point)
                        chunks=[
                                upper_chunk,
                                CDataChunk( input_chunk.end_addr(), op.crunch(lower_chunk, False), se=lower_chunk.ext()),
                                ]
                    else:
                        dprint("Just storing raw input file after header")
                        chunks=[
                                input_chunk,
                                ]
                    disp_chunks(chunks)
                    break

                dprint("\nsplitting input at 0x{:04x}".format(split_point))

                lower_chunk, upper_chunk = input_chunk.split_at(split_point)

                chunks = [
                        CDataChunk(data_start, op.crunch(upper_chunk, False), upper_chunk.ext()),
                        CDataChunk.ending_at(split_point, op.crunch(lower_chunk, True), lower_chunk.ext()), # in place => safe
                        ]

                gap=chunks[1].addr-chunks[0].end_addr()
                if gap<0:
                    adjustment = -gap
                    adjustment -= adjustment//5  # reduce larger steps a little
                    disp_chunks(chunks)
                    dprint("segment overlap = {}".format(-gap))
                    dprint("shifting split up by {} bytes and recrunching".format(adjustment))
                    split_point+=adjustment
                    continue
                disp_chunks(chunks)
                dprint("segment gap = {} (max={})".format(gap, max_gap))
                if gap>max_gap:
                    adjustment=gap-gap//4
                    dprint("shifting split down by {} bytes and recrunching".format(adjustment))
                    split_point-=adjustment
                    max_gap+=1+max_gap  # increase tolerance to escape oscillation.
                else:
                    """
                    ok.  At this point,
                    gap >= 0
                chunks[1].addr-chunks[0].end_addr() >= 0
                chunks[1].addr       >= chunks[0].end_addr()
                chunks[1].end_addr() >= chunks[0].end_addr() (as c1.end_addr>=c1.addr)
                split_point          >= chunks[0].end_addr()
                upper_chunk.addr     >= chunks[0].end_addr()

                therefore, chunk 0 is safe.
                    """
                    dprint("close enough." if gap>0 else "perfect.")
                    break

        op.stats.log_boot(len(output_chunk.data))

        for chunk,offset in zip(chunks,patch_offsets[:2]):
            gap = chunk.addr-output_chunk.end_addr()
            if gap>0:
                op.stats.log_gap(gap)
                output_chunk.data.extend([0xff,]*gap)

            if chunk.se is not None:
                output_chunk.data[offset+1]=lo(chunk.addr)
                output_chunk.data[offset+3]=hi(chunk.addr)
                output_chunk.data[offset+4]=0x20 # replace LDA decrunch with JSR decrunch
            else:
                op.stats.log_raw(len(chunk.data))
            output_chunk.extend(chunk)

        exec_addr=args.execAddr
        output_chunk.data[o_start+1]=lo(exec_addr)
        output_chunk.data[o_start+2]=hi(exec_addr)

        return output_chunk


    args = parse_args();
    op = CCruncher(greedy=args.fast)

    if args.raw:
        if args.infile.name.endswith('.prg'):
            print("warning, input file will be parsed as a .bin", file=sys.stderr)
        if args.outfile.name.endswith('.prg'):
            print("warning, output file will be written as a .bin", file=sys.stderr)
        input_data=list(bytearray(args.infile.read()))
        original_length = len(input_data)
        print("{:5d} bytes read from {}".format(
                original_length, args.infile.name))
        output_bytes = raw_crunch(args, op, input_data)

        if args.verbose:
            op.report(raw=True)

        args.outfile.write(bytearray(output_bytes))
        compressed_length = len(output_bytes)
        print("{:5d} bytes written to {} ({:4.1f}% of original size)".format(
                compressed_length, args.outfile.name,
                compressed_length * 100.0 / original_length)
                )
    else:
        if args.infile.name.endswith('.bin'):
            print("warning, input file will be parsed as a .prg", file=sys.stderr)
        if args.outfile.name.endswith('.bin'):
            print("warning, output file will be written as a .prg", file=sys.stderr)
        input_chunk=load_prg(args.infile)
        original_length = len(input_chunk.data) + 2
        print("{}: {:5d} bytes read from {}".format(
                input_chunk.ext(), original_length, args.infile.name))

        if len(input_chunk.data)<1:
            print("Input file can't be empty", file=sys.stderr)
            exit(1)

        if args.selfExtracting:
            if input_chunk.addr<0x0200:
                print(input_chunk.addr)
                print("Destination addresses below 0x0200 not supported by -x", file=sys.stderr)
                exit(1)
            output_chunk = sfx_crunch(args, op, input_chunk)
        else:
            output_chunk = level_crunch(args, op, input_chunk)

        op.stats.log_load_addr()
        op.stats.log_save_addr()
        if args.verbose:
            op.report()

        save_prg(args.outfile, output_chunk)
        compressed_length = len(output_chunk.data) + 2

        print("{}: {:5d} bytes written to {} ({:4.1f}% of original size)".format(
                output_chunk.ext(), compressed_length, args.outfile.name,
                compressed_length * 100.0 / original_length)
                )

