# https://atcoder.jp/contests/abc124/tasks/abc124_d
#
# クエリを何回も出す問題なので累積和系
# 反転する場合としない場合でそれぞれ累積和を作る
#
# わからん。解説
# https://drken1215.hatenablog.com/entry/2019/04/14/222900
# 連続する0を極力反転したい
# 文字列を個数で圧縮して累積和(奇数indexのところは連続した0の個数、偶数indexのところは連続した1の個数)
# 10 2
# 0111010011
# 10 2
# 1100010011
# 10 2
# 1100010010
# 10 2
# 0100110010

N, K = gets.split.map(&:to_i)
S = gets.chomp.chars.map(&:to_i)

cum = []
if S[0] == 0
  cum << 0
end

cont = 1
i = 1
while i <= N
  if S[i] == S[i - 1]
    cont += 1
    i += 1
    next
  else
    cum << cont
    cont = 1
    i += 1
  end
end

if S[-1] == 0
  cum << 0
end

# 累積和
sums = Array.new(cum.size + 1, 0)
cum.size.times do |i|
  sums[i + 1] = sums[i] + cum[i]
end

# 最大2K+1の範囲で反転を行えるのでその範囲ごとに最大値を調べていく
res = 0
l = 0
while l < sums.size
  r = l + K * 2 + 1
  if (r >= sums.size)
    r = sums.size - 1
  end

  # p(sums[r] - sums[l])
  res = [res, sums[r] - sums[l]].max
  l += 2
end

# p(cum)
# p(sums)
p(res)
