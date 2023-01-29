# https://atcoder.jp/contests/abc287/tasks/abc287_d

# 実験1
# |S| = 3
# |T| = 2
# x = 0, |T| - x = 2 => ?c
# x = 1, |T| - x = 1 => ac
# x = 2, |T| - x = 0 => a?
# a?c
# b?
#
# 実験2
# |S| = 7
# |T| = 4
# x = 2, |T| - x = 2 => abef
# x = 1, |T| - x = 3 => adef
# abc?def
# bc?r
#
# SとTがマッチするにはSi==Tiである必要がある => (1)
# S'とTがマッチするということは「Sの先頭x文字とTの先頭x文字がマッチ」しかつ「Sの末尾|T|-x文字とTの末尾|T|-x文字がマッチ」するということ => (2)
# つまりSとTの先頭がどこまでマッチするか？とSとTの末尾がどこまでマッチするか？をそれぞれ求めればよい
# あとはその結果を0~|T|までの全てのxに対して比較して答えを出す

S = gets.chomp
T = gets.chomp
sl = S.length
tl = T.length

pre = Array.new(sl + 1, false)
suf = Array.new(sl + 1, false)

pre[0] = true
sl.times do |i|
  break if i > tl
  if S[i] == T[i] || S[i] == "?" || T[i] == "?"
    pre[i + 1] = true
  else
    break
  end
end

S.reverse!
T.reverse!

suf[0] = true
sl.times do |i|
  break if i > tl
  if S[i] == T[i] || S[i] == "?" || T[i] == "?"
    suf[i + 1] = true
  else
    break
  end
end

(tl + 1).times do |x|
  if pre[x] && suf[tl - x]
    puts("Yes")
  else
    puts("No")
  end
end
