# frozen_string_literal: true

# https://atcoder.jp/contests/abc332/tasks/abc332_c
#
# ■考えたこと
#
# ■解説
#
n, m = gets.split.map(&:to_i)
s = gets.chomp.split('').map(&:to_i)
muji_max = m
logo_max = 0
muji_now = 0
logo_now = 0
buy_count = 0
n.times do |i|
  if s[i].zero?
    muji_now = 0
    logo_now = 0
  elsif s[i] == 1
    if muji_now < muji_max
      muji_now += 1
    elsif logo_now < logo_max
      logo_now += 1
    else
      logo_max += 1
      logo_now += 1
      buy_count += 1
    end
  elsif s[i] == 2
    if logo_now < logo_max
      logo_now += 1
    else
      logo_max += 1
      logo_now += 1
      buy_count += 1
    end
  end
end

puts buy_count
