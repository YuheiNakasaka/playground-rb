# frozen_string_literal: true

# https://atcoder.jp/contests/abc324/tasks/abc324_c
#
# ■考えたこと
# siの総和が5*10**5以下なので調べる必要のある文字列だけを調べればよさそう？
# ■解説
#
n, t = gets.chomp.split
n = n.to_i
t = t.chomp.split('')
tlen = t.length
tmin = tlen - 1
tmax = tlen + 1
targets = []
n.times do |i|
  chars = gets.chomp.split('')
  len = chars.length
  targets << [chars, len, i + 1] if tmin <= len && len <= tmax
end

ans = []
targets.each do |target|
  chars, len, index = target
  if len == tlen
    if chars == t
      ans << index
    else
      m = 1
      tlen.times do |i|
        m -= 1 if t[i] != chars[i]
        break if m.negative?
      end
      ans << index if m >= 0
    end
  elsif len == tlen - 1
    m = 0
    tlen.times do |i|
      m += 1 if t[i] != chars[i - m]
      break if m > 1
    end
    ans << index if m <= 1
  elsif len == tlen + 1
    m = 0
    len.times do |i|
      m += 1 if t[i - m] != chars[i]
      break if m > 1
    end
    ans << index if m <= 1
  end
end

puts ans.length
puts ans.join(' ')
