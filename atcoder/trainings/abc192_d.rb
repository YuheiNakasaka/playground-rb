# https://atcoder.jp/contests/abc192/tasks/abc192_d
#
# ■考えたこと
# Xに含まれる最大数をdとする
# d+1以上の数をどう数えるか？二分探索で大きい方からXをd+1進数で考えた時にMを下回るまで一気に探索を進めていく
# Xが1桁でM以下の場合はどうするか -> 種類数だからXが1桁の時はXがM以上なら1種類それ以外は0種類
# ■解説
#
X = gets.chomp.split("").map(&:to_i)
M = gets.to_i
d = X.max

l = d + 1
r = 10 ** 18 + 1
ans = 0

if X.size == 1 && X[0] <= M
  puts(1)
  exit
end

loop do
  mid = (l + r) / 2
  res = (0...(X.size)).to_a.inject(0) { |sum, i| sum + X[X.size - i - 1] * mid.pow(i) }
  if res <= M
    # p("l: #{l}, r: #{r}, mid: #{mid}, res: #{res}, ans: #{ans}")
    ans += mid - l + 1
    l = mid + 1
  else
    r = mid
  end

  # p("l: #{l}, r: #{r}, mid: #{mid}, res: #{res}, ans: #{ans}")

  break if l >= r || r < 0
end

puts(ans)
