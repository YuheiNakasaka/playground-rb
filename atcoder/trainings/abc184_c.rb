# https://atcoder.jp/contests/abc184/tasks/abc184_c
#
# ■考えたこと
#
# ■解説
# 0,1,2手以内に必ず辿り着けることを利用して0,1,2手の場合を全てチェックする
# 場合分けが難しかった...
# https://atcoder.jp/contests/abc184/editorial/339
r1, c1 = gets.split.map(&:to_i)
r2, c2 = gets.split.map(&:to_i)
r = r2 - r1
c = c2 - c1

if r == 0 && c == 0
  puts(0)
  exit
elsif r == c || r == -c
  puts(1)
  exit
elsif r.abs + c.abs <= 3
  puts(1)
  exit
elsif (r ^ c ^ 1) & 1 == 1
  puts(2)
  exit
elsif r.abs + c.abs <= 6
  puts(2)
  exit
elsif (r + c).abs <= 3 || (r - c).abs <= 3
  puts(2)
  exit
else
  puts(3)
  exit
end
