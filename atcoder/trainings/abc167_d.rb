# https://atcoder.jp/contests/abc167/tasks/abc167_d
# 2 <=  N <= 2*10^5
# 1 <=  Ai <= N
# 1 <=  K <= 10^18

# とりあえず循環するところまでAを進める
# i回目の進行のA[i]を記録しておく
# 巡回したらKをそこまでのiでmodを取ればよい？
# 巡回表列っぽい
# ある一定以上進めると必ず巡回する。そこからKのmod分進んだ時にどこにいるかを求めれば良いか？

# わからん。解説。
# https://drken1215.hatenablog.com/entry/2020/06/20/190700
#
# 周期性に注目することとmodを使うこともわかったがシュミレートしきれなかった。
# 以下は解説を読んでから再度解いてみた。

# N, $K = gets.split.map(&:to_i)
# A = gets.split.map(&:to_i)
# A.unshift(1)
# record = []
# seen = Array.new(N + 1, 0)
# i = 0
# while true
#   record << A[i]
#   seen[i] += 1
#   i = A[i]
#   # puts("i: #{i} seen: #{seen} record: #{record}")
#   if seen[i] > 0
#     while record[0] != i
#       if record[0] == i
#         break
#       end

#       if $K == 0
#         break
#       else
#         $K -= 1
#         record.shift
#       end
#     end

#     break
#   end
# end

# # p($K)
# # p(record)
# # p($K % (record.length - 1))
# p(record[$K % (record.length - 1)])

# ダブリングによる解法
N, $K = gets.split.map(&:to_i)
A = gets.split.map { |a| a.to_i - 1 }
dp = Array.new(61) { Array.new(N, 0) }
N.times do |i|
  dp[0][i] = A[i]
end

1.upto(60) do |i|
  N.times do |j|
    dp[i][j] = dp[i - 1][dp[i - 1][j]]
  end
end

ans = 0
i = 0
while $K > 0
  if $K & 1 > 0
    ans = dp[i][ans]
  end

  $K >>= 1
  i += 1
end

puts(ans + 1)
