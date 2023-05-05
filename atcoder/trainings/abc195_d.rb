# https://atcoder.jp/contests/abc195/tasks/abc195_d
#
# ■考えたこと
# N,Mの制約小さいからDPっぽいのでだるい...。でもクエリに応える感じだし違うか？
# Vがでかい荷物から順に空いてるところに入れていくじゃダメなのかね。まぁD問題だからダメなんだろうな。
# ■解説
# 「Vがでかい荷物から順に空いてるところに入れていく」だけだとダメで「荷物がギリギリ入るサイズの箱」を選ばないとだめっぽい
# 例えばW=10でX=18,13,23な場合、18でも23でも入るが、X=13に入れないとだめ。
# https://atcoder.jp/contests/abc195/editorial/846
INF = 10.pow(7)
N, M, Q = gets.split.map(&:to_i)
WV = Array.new(N)
N.times do |i|
  WV[i] = gets.split.map(&:to_i)
end

WV.sort_by! { |w, v| [-v, w] }

X = gets.split.map(&:to_i)
X.push(INF)
anses = []
Q.times do |i|
  ans = 0
  l, r = gets.split.map(&:to_i)
  box_used = Array.new(M + 1, false)
  package_used = Array.new(N + 1, false)
  N.times do |n|
    sm = -1
    M.times do |m|
      is_box_ban = l - 1 <= m && m <= r - 1
      if !is_box_ban && !box_used[m] && !package_used[n] && WV[n][0] <= X[m]
        sm = (WV[n][0] - X[sm]).abs < (WV[n][0] - X[m]).abs ? sm : m
      end
    end

    if sm != -1
      ans += WV[n][1]
      box_used[sm] = true
      package_used[n] = true
    end
  end

  anses << ans
end

puts(anses.join("\n"))
