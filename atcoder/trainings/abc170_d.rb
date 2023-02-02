# https://atcoder.jp/contests/abc170/tasks/abc170_d
#
# 問題の意味がわからなかったが下記の場合は
# 5
# 24 11 8 3 16
# 24は8で割り切れるからx
# 11はどれでも割り切れないからo
# 8はどれでも割り切れないからo
# 3はどれでも割り切れないからo
# 16はどれでも割り切れるからx
# で答えは3。という感じ。
#
# ナイーブにやると0(N^2)で間に合わない
# Aをソートして自分より大きい数だけ割り切れるかどうかを調べればいけないか？
# 全部同じ値の時に結局O(N^2)になりそうだがどうか

# 取り敢えずやってみたがまぁ普通にTLE
# N = gets.to_i
# a = gets.split.map(&:to_i)
# a.sort_by! { |x| -x }
# i = 0
# resp = 0
# divisible = false
# while i < a.length
#   iv = a[i]
#   j = i + 1
#   # puts("i: #{i} j: #{j} iv: #{iv} resp: #{resp}")
#   while j < a.length
#     jv = a[j]
#     if iv % jv == 0
#       divisible = true
#       break
#     end
#     j += 1
#   end
#   if i + 1 == a.length
#     if a[i] != a[i - 1]
#       resp += 1
#     end
#   else
#     if !divisible
#       resp += 1
#     end
#   end
#   divisible = false
#   i += 1
# end
# puts(resp)

# 解けない。解説は下記。
# https://drken1215.hatenablog.com/entry/2020/12/30/081500

N = gets.to_i
a = gets.split.map(&:to_i)
d = Array.new(2100000, 0)
a.each do |i|
  d[i] += 1
end

1.upto(2100000 - 1) do |i|
  next if d[i] == 0
  d[i] = 0 if d[i] > 1

  j = 2 * i
  while j < 2100000
    d[j] = 0
    j += i
  end
end

puts(d.reduce(0) { |sum, i| sum + i })
