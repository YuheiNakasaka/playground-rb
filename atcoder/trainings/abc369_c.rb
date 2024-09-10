# frozen_string_literal: true

# https://atcoder.jp/contests/abc369/tasks/abc369_c
#
# ■考えたこと
#
# ■解説
#
N = gets.to_i
A = gets.split.map(&:to_i)
ds = []
(N - 1).times do |i|
  ds << A[i + 1] - A[i]
end

ans = 0
prev = ds[0]
cnt = 1
1.upto(N - 1) do |i|
  if prev == ds[i]
    cnt += 1
  else
    ans += (cnt + 1) * cnt / 2
    cnt = 1
  end
  prev = ds[i]
end

puts ans + N
