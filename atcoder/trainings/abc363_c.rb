# frozen_string_literal: true

# https://atcoder.jp/contests/abc363/tasks/abc363_c
#
# ■考えたこと
#
# ■解説
#

N, K = gets.split.map(&:to_i)
S = gets.chomp
slist = Set.new(S.chars.permutation).to_a
ans = 0
slist.each do |arr|
  ok = true
  0.upto(N - K) do |i|
    f = true
    K.times do |j|
      f = false if arr[i + j] != arr[i + K - 1 - j]
    end
    ok = false if f
  end
  ans += 1 if ok
end
puts ans
