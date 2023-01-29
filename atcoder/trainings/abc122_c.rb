# 累積和の問題
# https://atcoder.jp/contests/abc122/tasks/abc122_c
# 例:
# N, Q = [8, 3]
# S = "ACACTACG".split("").unshift("")

N, Q = gets.split.map(&:to_i)
S = gets.chomp.split("").unshift("")

s = Array.new(N + 1, 0)
N.times do |i|
  if S[i] == "A" && S[i + 1] == "C"
    s[i + 1] = s[i] + 1
  else
    s[i + 1] = s[i]
  end
end

Q.times do
  l, r = gets.split.map(&:to_i)
  puts(s[r] - s[l])
end
