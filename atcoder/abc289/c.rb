# 余事象か？
require "set"

N, M = gets.split.map(&:to_i)
S = Array.new(M) { [] }
M.times do |i|
  c = gets.to_i
  S[i] = gets.split.map(&:to_i)
end

ans = 0
(1 << M).times do |bit|
  m = Set.new
  M.times do |i|
    if bit & (1 << i) != 0
      j = 0
      while j < S[i].size
        m.add(S[i][j])
        j += 1
      end
    end
  end

  if m.length == N
    ans += 1
  end
end

puts(ans)
