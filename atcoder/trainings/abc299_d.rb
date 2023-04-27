# https://atcoder.jp/contests/abc299/tasks/abc299_d
#
# ■考えたこと
# 問題の意味は理解できるが20回の質問で回答を導ける方法がわからない。
# 雰囲気的には二分探索で求める数値を見つけていくのかなと思うが。
# あとは確率的なアプローチで解くのか？
# ■解説
# 必ずpが存在するという条件から二分探索で解くことができる。
# https://atcoder.jp/contests/abc299/tasks/abc299_d/editorial
$stdout.sync = true
N = gets.to_i
l = 1
r = N
loop do
  m = (l + r) / 2
  puts("? #{m}")
  s = gets.chomp.to_i
  if s == 0
    l = m
  else
    r = m
  end

  if l + 1 == r
    puts("! #{l}")
    exit
  end
end
