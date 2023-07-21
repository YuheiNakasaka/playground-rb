# https://atcoder.jp/contests/abc286/tasks/abc286_c
#
# ■考えたこと
# 回文の扱いがよくわからん。制約的には全探索っぽい。
# ■解説
# 左端を一番右に追加する時のコスト計算(A) と 任意の位置の文字を変更するコスト計算(B)を別々に計算する
# (A)を固定して、(B)を変更していく実装
# https://drken1215.hatenablog.com/entry/2023/01/29/201129
n, a, b = gets.split.map(&:to_i)
s = gets.chomp.split("")

res = 1 << 60
n.times do |i|
  cost = 0
  (n / 2).times do |j|
    if s[j] != s[n - 1 - j]
      cost += b
    end
  end

  res = [res, cost + a * i].min

  h = s.shift
  s.push(h)
end

puts(res)
