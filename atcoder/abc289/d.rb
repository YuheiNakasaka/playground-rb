# 3
# 3 4 5 -> 1階に3~5段登ることができる
# 4
# 4 5 6 8 -> 4,5,6,8段目に餅が設置されている
# 15 -> 15段目に登りたい
#
# 多分貪欲かdpか？
# X側から考えるのはどうか？
# 停止条件付のナップザック問題だと考えるのはどうか？
# 3次元dp的なやつ?

# わからん。解説。
# https://atcoder.jp/contests/abc289/editorial/5715
#
# やはりDPだった。しかしn次元dp的なやつではなくめちゃくちゃ素朴なDPだった。これは解けたな...

N = gets.to_i
A = gets.split.map(&:to_i)
M = gets.to_i
B = gets.split.map(&:to_i)
X = gets.to_i

dp = Array.new(X + 1, 0)
available = Array.new(X + 1, 1)
B.each do |b|
  available[b] = 0
end

dp[0] = 1
1.upto(X) do |i|
  if available[i] == 0
    # 餅がある場合
    dp[i] = 0
  else
    # 餅がない場合
    A.each do |a|
      if i >= a
        dp[i] |= dp[i - a]
      end
    end
  end
end

# puts("dp: #{dp}")
# puts("av: #{available}")
puts(dp[X] == 1 ? "Yes" : "No")
