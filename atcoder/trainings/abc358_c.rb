# frozen_string_literal: true

# https://atcoder.jp/contests/abc358/tasks/abc358_c
#
# ■考えたこと
#
# ■解説
#
N, M = gets.split.map(&:to_i)

S = Array.new(N)
N.times do |i|
  S[i] = gets.chomp.split('')
end

ans = nil
goal = (1..M).to_a.inject(:+)
check = 0
sellings = {}
nums = (0..(N - 1)).to_a
1.upto(N) do |i|
  nums.combination(i) do |c|
    # p c
    c.each do |j|
      S[j].each_with_index do |s, k|
        if sellings[k].nil? && s == 'o'
          check += k + 1
          sellings[k] = true
        end
      end
    end

    # p "check: #{check} goal: #{goal}"
    # p "sellings: #{sellings}"
    if check == goal
      ans = i
      break
    end

    sellings = {}
    check = 0
  end
  break unless ans.nil?
end

puts ans
