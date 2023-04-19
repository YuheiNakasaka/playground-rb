# https://atcoder.jp/contests/abc191/tasks/abc191_c
#
# ■考えたこと
# 外枠は白マス。内枠の黒マスでできる多角形を考える。
# 自己交叉とは? -> https://www.grezzo.co.jp/tech/archives/1258
# 頂点となりうる黒マス以外の黒マスを削除する
# ■解説
# 問題文の読解ができなかった。サンプルが少なかったのもあって賛否ある問題だったらしい。
# 問われていること自体は理解さえできれば実装は難しくない。
# https://atcoder.jp/contests/abc191/tasks/abc191_c
H, W = gets.split.map(&:to_i)
S = Array.new(H) { gets.chomp.chars }
ans = 0

(H - 1).times do |h|
  (W - 1).times do |w|
    vertex = 0
    2.times do |k|
      2.times do |l|
        vertex += 1 if S[h + k][w + l] == "#"
      end
    end

    if vertex == 1 || vertex == 3
      ans += 1
    end
  end
end

puts(ans)
