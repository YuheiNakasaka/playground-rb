# https://atcoder.jp/contests/typical90/tasks/typical90_b
#
# bit全探索で全て列挙して正しい()かを判定する？

N = gets.to_i
anses = []
cnt = 0
bit = 0
n = (1 << N)
while bit < n
  ans = ""
  cnt = 0
  i = 0
  while i < N
    if bit & (1 << i) != 0
      cnt += 1
      ans += "("
    else
      cnt -= 1
      ans += ")"
    end

    break if cnt < 0
    i += 1
  end

  if cnt == 0
    anses << ans
  end

  bit += 1
end

i = 0
anses.sort!
while i < anses.length
  puts(anses[i])
  i += 1
end
