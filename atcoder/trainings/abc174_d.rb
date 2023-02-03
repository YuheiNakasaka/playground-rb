# https://atcoder.jp/contests/abc174/tasks/abc174_d
#
# RRRWWR => RRRWWW -> 1回
# RRRWWRR => RRRWWWR => RRRWWWW-> 2回
# WRWWRWRR => RRWWRWRW => RRRRWWWW -> 3回
#
# Wより右にあるRの中で一番外側のRとWを入れ替えることを続ければいけそう？

# 解けた。解説は下記。
# https://img.atcoder.jp/abc174/editorial.pdf
# この回答すごい。確かに...。
# https://kuruton.hatenablog.com/entry/2020/08/04/214606

N = gets.to_i
c = gets.chomp
chars = c.chars
all_rcnt = chars.count("R")
rcnt = all_rcnt

rleft = Array.new(N + 1, 0)
N.times do |i|
  if chars[i] == "R"
    all_rcnt -= 1
  end

  rleft[i] = all_rcnt
end

ans = 0
nn = N
N.times do |i|
  if chars[i] == "W"
    # puts("i: #{i} nn: #{nn} rcnt: #{rcnt} rleft: #{rleft}")
    rcnt = [rleft[i], rcnt].min
    break if rcnt == 0
    nn.downto(i + 1) do |j|
      if chars[j] == "R"
        chars[i], chars[j] = chars[j], chars[i]
        rcnt -= 1
        nn = j
        ans += 1
        break
      end
    end
  end
end

puts(ans)
