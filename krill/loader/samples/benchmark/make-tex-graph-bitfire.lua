#! /usr/bin/env lua

for line in io.stdin:lines() do
  local loader_cpu, frames_lo, frames_hi = line:match("^%S+%s*(%x+)%s*(%x+)%s*(%x+)")

  loader_cpu = tonumber("0x"..loader_cpu)
  frames = tonumber("0x"..frames_lo) + (256 * tonumber("0x"..frames_hi))

  throughput = 185526 * 50 / frames;

  print(("(%d, %.f)"):format(loader_cpu, throughput))
end
