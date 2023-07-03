# https://atcoder.jp/contests/abc308/tasks/abc308_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
arr = n.times.map do |i|
  a, b = gets.split.map(&:to_i)
  [a, a + b, i + 1]
end

arr.sort! do |ai, aj|
  # 成功率の降順
  # ai/ai+bi <=> aj/aj+bjを変形して
  # ai * (aj + bj) <=> aj * (ai + bi)
  x = ai[0] * aj[1] <=> aj[0] * ai[1]
  # 成功率が同じ場合はindexの昇順
  x != 0 ? -x : ai[2] <=> aj[2]
end

puts(arr.map(&:last).join(" "))
