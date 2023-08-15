# https://atcoder.jp/contests/abc287/tasks/abc287_e
#
# ■考えたこと
# 愚直にやるとSiとSjの比較でO(n^2)はかかる。
# DPとかで一致する部分の事前計算とかするのかね。
# ■解説
# そもそも部分文字列の一致だと誤読してたのが敗因。文字でソートして隣り合う文字列の共通部分を数えるというのがポイント。
# https://atcoder.jp/contests/abc287/tasks/abc287_e/editorial
n = gets.to_i
s = Array.new(n) { [] }
n.times do |i|
  s[i][0] = gets.chomp
  s[i][1] = i
end

s.sort_by! { |a| a[0] }

ans = Array.new(n, 0)
(n - 1).times do |i|
  j = 0
  cnt = 0
  while s[i][0].size > j && s[i + 1][0].size > j
    break if s[i][0][j] != s[i + 1][0][j]
    cnt += 1
    j += 1
  end

  ans[s[i][1]] = [ans[s[i][1]], cnt].max
  ans[s[i + 1][1]] = [ans[s[i + 1][1]], cnt].max
end

ans.each do |a|
  puts(a)
end
