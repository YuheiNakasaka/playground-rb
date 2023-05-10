# https://atcoder.jp/contests/abc198/tasks/abc198_c
#
# ■考えたこと
# 原点からP(X,Y)までのユークリッド距離をRいけるところまでいき、ピッタリならOP/Rを出力。
# ピッタリいけない場合はギリギリから1回分多くRを追加して調整すれば辿り着けるはず
# OP > Rの場合は1回では超えてしまうからもう1回追加する必要がある。
# ■解説
# 考え方は違うけど結果的に合ってた
# https://atcoder.jp/contests/abc198/editorial/1043
r, x, y = gets.split.map(&:to_i)
op = Math.sqrt(x ** 2 + y ** 2)
if op % r == 0
  puts((op / r).to_i)
elsif (op / r).to_i == 0
  puts(2)
else
  puts((op / r).to_i + 1)
end
