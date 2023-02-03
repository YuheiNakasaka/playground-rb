# https://atcoder.jp/contests/abc173/tasks/abc173_d
# DPっぽいがNは2*10^5でAiが10^9なのでDPするとTLEになりそう
# 人が割り込めば割り込むほど心地よさは減っていくので最初にAのでかい人を入れて行ったほうがよさそう
# あとはどこに割り込むと心地よさが最大になるのかを考える
# 貪欲法ってやつか？

# 6
# 6, 5, 4, 3, 2, 1
# の時
# 6 -> 6,5 -> 6,5,4 -> 6,3,5,4 -> 6,3,5,2,4 -> 6,3,5,2,4,1
# 0     6      5         5           4             4

# わからん。解説
# https://yamakasa.net/atcoder-abc-173-d/
# 貪欲に1回・2回・2回・・・と都度の最大値を選んでいくっぽい

N = gets.to_i
a = gets.split.map(&:to_i).sort.reverse

ans = 0
q = []
(N - 1).times do |i|
  if i == 0
    ans += a[i]
  else
    q.push(a[i])
    q.push(a[i])
    ans += q.shift
  end
end

p(ans)
