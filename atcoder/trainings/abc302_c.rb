# https://atcoder.jp/contests/abc302/tasks/abc302_c
#
# ■考えたこと
# N!の列の並び方を全探索。さらにその中で条件を満たすものを全探索。
# 条件を満たすもの=TiとTi+1の文字がM-1文字以上位置と中身が一致すること
# ■解説
#
N, M = gets.split.map(&:to_i)
s = []
N.times do |n|
  s << gets.chomp.split("")
end

ans = false
s.permutation(N) do |rows|
  check = true
  (rows.size - 1).times do |i|
    ok_cnt = 0
    a = rows[i]
    b = rows[i + 1]
    M.times do |j|
      ok_cnt += 1 if a[j] == b[j]
    end

    if ok_cnt < M - 1
      check = false
      break
    end
  end

  if check
    ans = true
    break
  end
end

puts(ans ? "Yes" : "No")
