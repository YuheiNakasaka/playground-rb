# https://atcoder.jp/contests/abc313/tasks/abc313_c
#
# ■考えたこと
# 最大ヒープと最小ヒープを使って、d(最大値-最小値)を最大値-dと最小値+dにして再度ヒープに入れる。
# これを繰り返して、最後に最大値と最小値が同じになったら終了。とかでどうか。証明はできないけどなんかこんな感じでそれっぽい答えは出そう。
# 数え上げのところのto_iしてるあたりで誤差が出て一部WAになりそう。
# ■解説
# https://atcoder.jp/contests/abc313/editorial/6901
n = gets.to_i
a = gets.split.map(&:to_i)
sum = a.sum
a.sort!
b = Array.new(n) { sum / n }
for i in 0...(sum % n)
  b[n - 1 - i] += 1
end

ans = 0
for i in 0...n
  ans += (a[i] - b[i]).abs
end

puts(ans / 2)
