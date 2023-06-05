# https://atcoder.jp/contests/abc303/tasks/abc303_c
#
# ■考えたこと
# 条件はいろいろあるがxyを素直にシミュレーションしていくだけ。
# ■解説
# 1WAしてしまった。アイテムを「消費する」というのは1度使ったらもう使えないという意味なのであった...
# https://atcoder.jp/contests/abc303/editorial/6440

class Solver
  def initialize
  end

  def solve
    n, m, h, k = gets.split.map(&:to_i)
    s = gets.chomp.split("")
    xy = {}
    m.times do |i|
      x, y = gets.split.map(&:to_i)
      xy["#{x}_#{y}"] = true
    end

    ans = "Yes"
    o = [0, 0]
    n.times do |i|
      case s[i]
      when "R"
        h -= 1
        o = [o[0] + 1, o[1]]
      when "L"
        h -= 1
        o = [o[0] - 1, o[1]]
      when "U"
        h -= 1
        o = [o[0], o[1] + 1]
      when "D"
        h -= 1
        o = [o[0], o[1] - 1]
      end

      if h < 0
        ans = "No"
        break
      end

      if xy["#{o[0]}_#{o[1]}"] == true && h < k
        xy["#{o[0]}_#{o[1]}"] = false
        h = k
      end
    end

    puts(ans)
  end
end

Solver.new.solve
