# frozen_string_literal: true

# https://atcoder.jp/contests/abc356/tasks/abc356_c
#
# ■考えたこと
#
# ■解説
#
N, M, K = gets.split.map(&:to_i)
tests = []
M.times do
  arr = gets.split
  tests << [arr[0].to_i, arr[1..(arr.size - 2)].map(&:to_i), arr[arr.size - 1]]
end
ans = 0
(1 << N).times do |bit|
  is_valid = true
  tests.each do |test|
    _ = test[0]
    r = test[2]
    a = test[1]
    k = 0
    a.each do |ai|
      # p "ai: #{ai}, bit: #{bit.to_s(2)}, bit & (1 << (ai - 1)): #{bit & (1 << (ai - 1))}"
      k += 1 if bit & (1 << (ai - 1)) != 0
    end

    if k >= K && r == 'o' || k < K && r == 'x'
    else
      is_valid = false
    end
    # p "bit: #{bit.to_s(2)}, k: #{k}, K: #{K}, r: #{r} is_valid: #{is_valid}"
  end
  ans += 1 if is_valid
end

puts ans
