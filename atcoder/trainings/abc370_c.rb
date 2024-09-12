# frozen_string_literal: true

# https://atcoder.jp/contests/abc370/tasks/abc370_c
#
# ■考えたこと
# Si,Tiの差を計算する。左から順にSi,Tiを比べていき、Si > Tiの場合にSiをTiに変更してXに追加する。
# Si > Tiの文字がなくなった場合はSi < Tiの文字の差が小さいものから順にSiをTiに変更してXに追加する。
# ■解説
#
S = gets.chomp.chars
T = gets.chomp.chars
N = S.size
h = {}
('a'..'z').each.with_index(1) do |c, i|
  h[c] = i
end

X = []
N.times do |i|
  if h[S[i]] > h[T[i]]
    S[i] = T[i]
    X << S.clone
  end
end

(N - 1).downto(0) do |i|
  if h[T[i]] > h[S[i]]
    S[i] = T[i]
    X << S.clone
  end
end

puts X.size
X.each do |x|
  puts x.join
end
