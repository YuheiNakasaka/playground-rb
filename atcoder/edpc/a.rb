# https://atcoder.jp/contests/dp/tasks/dp_a
#
# ■DPの基本中の基本問題
# DPは「最小化問題」「最大化問題」「数え上げ問題」「判定問題」「確率問題」の大体5種類がある
# これはそのうちの「最小化問題」になる。
#
# ■DPの作り方
# 1) DP配列全体を「DPの種類に応じた初期値」で初期化
# 2) 初期条件を入力
# 3) ループを回す
# 4) テーブルから解を得て出力
#
# ■計算量
# O(V + E): Vはテーブルのノード数、Eはテーブルのエッジ数
#
# ■コツ
# 「再帰的に全探索することのイメージを磨きあげる」 / 「dp[ i ] には i 番目までの探索過程がまとめられている」
# https://qiita.com/drken/items/dc53c683d6de8aeacf5a

N = gets.to_i
h = gets.split.map(&:to_i)
dp = Array.new(N, 10 ** 18)
dp[0] = 0

# n - 1段目からn段目に移動する場合とn - 2段目からn段目に移動する場合で計算し、
# n段目におけるコストが小さい方を選ぶようにすればよい
N.times do |n|
  if n - 1 >= 0
    dp[n] = (h[n - 1] - h[n]).abs + dp[n - 1]
  end

  if n - 2 >= 0
    dp[n] = [(h[n - 2] - h[n]).abs + dp[n - 2], dp[n]].min
  end
end

p(dp[N - 1])
