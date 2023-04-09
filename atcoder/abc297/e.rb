# 10^10通りのAの組み合わせを全探索するとTLEする。
# Kが2x10^5で制約が3秒なのでKの方を基準に考えてみる
N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort
h = {}
cur = A[0]
h = {cur => true}
K.times do |i|
  # curかAから1つかA[i]+curのうち小さいものでまだ選ばれてないものを選ぶ
  # これがO(10^2)くらいでできれば通りそうだが、どうやって実装するか
end
