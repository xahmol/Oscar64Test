#! /usr/bin/env lua

local lines = {}

for line in io.stdin:lines() do
  lines[#lines + 1] = line
end

local loader_cpu

for k, v in pairs(lines) do
  if k % 2 == 1 then
    loader_cpu = v:match("^%S+%s*(%x+)")
  else
    local f1l,f2l,f3l,f4l,f5l,f6l,f7l,f8l, f1h,f2h,f3h,f4h,f5h,f6h,f7h,f8h = v:match("^%S+%s*(%x+)%s*(%x+)%s*(%x+)%s*(%x+)%s*(%x+)%s*(%x+)%s*(%x+)%s*(%x+)%s*(%x+)%s*(%x+)%s*(%x+)%s*(%x+)%s*(%x+)%s*(%x+)%s*(%x+)%s*(%x+)")

    loader_cpu = tonumber("0x"..loader_cpu)

    local frames = {}
    frames[1] = tonumber("0x"..f1l) + (256 * tonumber("0x"..f1h))
    frames[2] = tonumber("0x"..f2l) + (256 * tonumber("0x"..f2h))
    frames[3] = tonumber("0x"..f3l) + (256 * tonumber("0x"..f3h))
    frames[4] = tonumber("0x"..f4l) + (256 * tonumber("0x"..f4h))
    frames[5] = tonumber("0x"..f5l) + (256 * tonumber("0x"..f5h))
    frames[6] = tonumber("0x"..f6l) + (256 * tonumber("0x"..f6h))
    frames[7] = tonumber("0x"..f7l) + (256 * tonumber("0x"..f7h))
    frames[8] = tonumber("0x"..f8l) + (256 * tonumber("0x"..f8h))

    table.sort(frames)

    throughput = 0x4400 * 50 / ((frames[4] + frames[5]) / 2);

    print(("(%d, %.f)"):format(loader_cpu, throughput))
  end
end
