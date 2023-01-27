# いもす法
# https://note.com/kirimin_chan/n/n7663e3bb8a05
#
# 主に配列やグラフなどの一部分に対して同一の変更を複数回行う場合に、
# 変更する範囲の最初と最後にだけ変更内容をメモしておき、最後に最初から順番に合算していくことで、少ない計算量で解くことが出来る
#
# 1､2､3～Nまでの番号がついた配列がある。配列の値は始めすべて0である。
# 範囲を指定する整数a,bのQ個のクエリが与えられ、クエリではNaからNbまでを+1する。
# クエリ実行後に配列の値はどう変化するか。

# 4 3
# 1 3
# 2 4
# 1 2

N, Q = gets.split.map(&:to_i)

a = Array.new(N + 1, 0)
Q.times do
  na, nb = gets.split.map(&:to_i)
  a[na] += 1
  if nb + 1 < N + 1
    a[nb + 1] -= 1
  end
end

res = Array.new(N + 1, 0)
(1..N).map do |i|
  res[i] = res[i - 1] + a[i]
end

p(res)
