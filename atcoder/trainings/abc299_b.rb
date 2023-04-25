# https://atcoder.jp/contests/abc299/tasks/abc299_b
#
# ■考えたこと
#
# ■解説
#
N, T = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)
R = gets.split.map(&:to_i)

is_t = false
N.times do |i|
  if C[i] == T
    is_t = true
  end
end

max = -1
ans = -1
if is_t
  N.times do |i|
    if C[i] == T && max < R[i]
      max = R[i]
      ans = i + 1
    end
  end

  puts(ans)
else
  N.times do |i|
    if C[i] == C[0] && max < R[i]
      max = R[i]
      ans = i + 1
    end
  end

  puts(ans)
end
