# https://atcoder.jp/contests/abc171/tasks/abc171_c
#
# ■考えたこと
# Nは10^15とでかい。名前はa~zで26文字、その次はaa,ab,ac,..zzで26*26+26、...
# となるのでつまり26**i周目 + 前周の周期で桁が変わる
# (N-1)を26で割った商が0になるまで(N-1)%26を繰り返す。
# ■解説
# N-1をするのがミソ。
# https://drken1215.hatenablog.com/entry/2020/06/21/225500
# https://blog.hamayanhamayan.com/entry/2020/06/23/193042

n = gets.to_i

alp = ("a".."z").to_a
base = 26
ans = ""
while n != 0
  r = (n - 1) % base
  n = (n - 1) / base
  ans = alp[r] + ans
end

puts(ans)
