# https://atcoder.jp/contests/typical90/tasks/typical90_h
#
# ■考えたこと
# atcoderそれぞれの文字で後ろから累積和を計算しておく
# その後a,t,c,o,d,e,rの順に初出の位置を前から探す
# 見つかったらその次の文字が出てくる位置を探す
# 見つかったら前の文字の初出の位置の累積和から今の位置の前の文字の累積和を引いて記録していく
# 最後は記録した文字を掛け算して10**9+7で割った余りを出力して終わり
#
# 合ってると思ったけどWA。解説
# https://atcoder.jp/contests/typical90/tasks/typical90_h
#
# 状態DPで解くらしい
# 選ぶ/選ばないの2択で遷移する場合はほぼDPで解けるらしい
# https://drken1215.hatenablog.com/entry/2022/04/01/121700

# N = gets.to_i
# S = gets.chomp
# NUM = 10 ** 9 + 7

# atcoder = ["a", "t", "c", "o", "d", "e", "r"]
# sum = Array.new(7) { Array.new(N + 1, 0) }
# 7.times do |i|
#   (N - 1).downto(0) do |j|
#     sum[i][j] = sum[i][j + 1]
#     if atcoder[i] == S[j]
#       sum[i][j] = sum[i][j] + 1
#     end
#   end
# end

# ans = []
# prev_char_sum = -1
# s_index = 0
# N.times do |i|
#   if s_index < atcoder.length && atcoder[s_index] == S[i]
#     if s_index > 0
#       ans << (prev_char_sum - sum[s_index - 1][i])
#     end

#     prev_char_sum = sum[s_index][i]
#     s_index += 1
#   end

#   if i == N - 1
#     ans << prev_char_sum
#   end
# end

# if ans.empty?
#   puts(0)
# else
#   puts(ans.inject(:*) % NUM)
# end

N = gets.to_i
S = gets.chomp
NUM = 10 ** 9 + 7

dp = Array.new(N + 1) { Array.new(8, 0) }
dp[0][0] = 1
N.times do |i|
  0.upto(7) do |j|
    dp[i + 1][j] += dp[i][j]
    if S[i] == "a" && j == 0
      dp[i + 1][j + 1] += dp[i][j]
    end

    if S[i] == "t" && j == 1
      dp[i + 1][j + 1] += dp[i][j]
    end

    if S[i] == "c" && j == 2
      dp[i + 1][j + 1] += dp[i][j]
    end

    if S[i] == "o" && j == 3
      dp[i + 1][j + 1] += dp[i][j]
    end

    if S[i] == "d" && j == 4
      dp[i + 1][j + 1] += dp[i][j]
    end

    if S[i] == "e" && j == 5
      dp[i + 1][j + 1] += dp[i][j]
    end

    if S[i] == "r" && j == 6
      dp[i + 1][j + 1] += dp[i][j]
    end
  end

  0.upto(7) do |j|
    dp[i + 1][j] %= NUM
  end
end

puts(dp[S.length][7])
