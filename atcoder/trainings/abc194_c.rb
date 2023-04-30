# https://atcoder.jp/contests/abc194/tasks/abc194_c
#
# ■考えたこと
# |Ai| <= 200 なのであり得る引き算の組み合わせは200x200。その組み合わせの場合の計算を行い、それが何種類あるかをかければO(10^5)程度で解ける。
# ■解説
# 簡単すぎて制約忘れてたww
# https://atcoder.jp/contests/abc194/editorial/826

require "set"

N = gets.to_i
A = gets.split.map(&:to_i)
set = Set.new(A).to_a
hist = {}
A.each do |a|
  hist[a] ||= 0
  hist[a] += 1
end

ans = 0
0.upto(set.size - 1) do |i|
  i.upto(set.size - 1) do |j|
    ans += (set[i] - set[j]).abs.pow(2) * hist[set[i]] * hist[set[j]]
  end
end

puts(ans)
