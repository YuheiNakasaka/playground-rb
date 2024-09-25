# frozen_string_literal: true

# https://atcoder.jp/contests/abc372/tasks/abc372_c
#
# ■考えたこと
#
# ■解説
#
N, Q = gets.split.map(&:to_i)
S = gets.chomp.chars

abc_cnt = 0
(N - 2).times do |i|
  abc_cnt += 1 if S[i, 3] == %w[A B C]
end

ans = []
Q.times do
  x, c = gets.split
  x = x.to_i - 1

  if (x - 2 >= 0 && "#{S[x - 2]}#{S[x - 1]}#{S[x]}" == 'ABC' && "#{S[x - 2]}#{S[x - 1]}#{c}" != 'ABC') ||
     (x - 1 >= 0 && x + 1 < N && "#{S[x - 1]}#{S[x]}#{S[x + 1]}" == 'ABC' && "#{S[x - 1]}#{c}#{S[x + 1]}" != 'ABC') ||
     (x + 2 < N && "#{S[x]}#{S[x + 1]}#{S[x + 2]}" == 'ABC' && "#{c}#{S[x + 1]}#{S[x + 2]}" != 'ABC')
    abc_cnt -= 1
  end

  if (x - 2 >= 0 && "#{S[x - 2]}#{S[x - 1]}#{S[x]}" != 'ABC' && "#{S[x - 2]}#{S[x - 1]}#{c}" == 'ABC') ||
     (x - 1 >= 0 && x + 1 < N && "#{S[x - 1]}#{S[x]}#{S[x + 1]}" != 'ABC' && "#{S[x - 1]}#{c}#{S[x + 1]}" == 'ABC') ||
     (x + 2 < N && "#{S[x]}#{S[x + 1]}#{S[x + 2]}" != 'ABC' && "#{c}#{S[x + 1]}#{S[x + 2]}" == 'ABC')
    abc_cnt += 1
  end

  S[x] = c
  ans << abc_cnt
end

ans.each do |a|
  puts a
end
