# https://atcoder.jp/contests/abc199/tasks/abc199_c
#
# ■考えたこと
# 前N文字と後ろN文字とその他の文字部分で分けて扱う
# ■解説
# 解けたが問題文を読み間違えていて少し難しく解いてしまった|S|は2NなのでNと|S|-Nの間の文字は考えなくて良かった...
# https://blog.hamayanhamayan.com/entry/2021/04/25/002202
N = gets.to_i
S = gets.chomp
Q = gets.to_i
prev = S[0..(N - 1)]
mid = S[N..(S.size - 1 - N)]
nxt = S[(S.size - N)..-1]
Q.times do |i|
  t, a, b = gets.split.map(&:to_i)
  if t == 1
    a -= 1
    b -= 1
    tmp = ""
    if a < N
      tmp = prev[a]
      if b < N
        prev[a] = prev[b]
        prev[b] = tmp
      elsif N <= b && b < S.size - N
        prev[a] = mid[b - N]
        mid[b - N] = tmp
      else
        prev[a] = nxt[b - prev.size - mid.size]
        nxt[b - prev.size - mid.size] = tmp
      end
    elsif N <= a && a < S.size - N
      tmp = mid[a - N]
      if b < N
        mid[a - N] = prev[b]
        prev[b] = tmp
      elsif N <= b && b < S.size - N
        mid[a - N] = mid[b - N]
        mid[b - N] = tmp
      else
        mid[a - N] = nxt[b - prev.size - mid.size]
        nxt[b - prev.size - mid.size] = tmp
      end
    else
      tmp = nxt[a - prev.size - mid.size]
      if b < N
        nxt[a - prev.size - mid.size] = prev[b]
        prev[b] = tmp
      elsif N <= b && b < S.size - N
        nxt[a - prev.size - mid.size] = mid[b - N]
        mid[b - N] = tmp
      else
        nxt[a - prev.size - mid.size] = nxt[b - prev.size - mid.size]
        nxt[b - prev.size - mid.size] = tmp
      end
    end
  else
    tmp = prev
    prev = nxt
    nxt = tmp
  end
end

puts(prev + mid + nxt)
