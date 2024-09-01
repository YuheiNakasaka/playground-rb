# frozen_string_literal: true

# https://atcoder.jp/contests/abc367/tasks/abc367_c
#
# ■考えたこと
#
# ■解説
#
$n, $k = gets.split.map(&:to_i)
r = gets.split.map(&:to_i)
$ans = []
def dfs(src, list)
  if src.empty?
    $ans << list if (list.sum % $k).zero?
    return
  end
  src.first.each do |a|
    dfs(src[1..], list + [a])
  end
end

src = []
$n.times do |i|
  src << (1..r[i]).to_a
end

dfs(src, [])
$ans.each do |a|
  puts a.join(' ')
end
