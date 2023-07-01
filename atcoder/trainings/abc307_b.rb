# https://atcoder.jp/contests/abc307/tasks/abc307_b
#
# ■考えたこと
#
# ■解説
#

n = gets.to_i
s = []
n.times do |i|
  s << gets.chomp
end

exist = false
0.upto(n - 1) do |i|
  0.upto(n - 1) do |j|
    next if i == j

    [s[i] + s[j], s[j] + s[i]].each do |str|
      l = str.length
      check = true
      (l / 2).times do |t|
        if str[t] != str[l - t - 1]
          check = false
          break
        end
      end

      exist = true if check
      break if exist
    end

    break if exist
  end

  break if exist
end

if exist
  puts("Yes")
else
  puts("No")
end
