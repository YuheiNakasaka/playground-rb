# 二分探索 しゃくとり法 尺取法
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_m
#
class Solver
  def initialize
  end

  def solve
    n, k = gets.split.map(&:to_i)
    a = gets.split.map(&:to_i)
    # rは差がkを満たすa[i]の組の一番右端の位置をiごとにまとめた配列
    # 例えばk=10でa=[11, 12, 16, 22, 27, 28, 31]の時
    # r: [2 , 3 , 3 , 6 , 6 , 6 , 6, 0]
    r = Array.new(n, 0)

    # n-1なのはa[r[i]+1]でアクセスするため。最後の要素同士は差が0なので考えなくても良い。
    (n - 1).times do |i|
      if i == 0
        # 最初は右端は0
        r[i] = 0
      else
        r[i] = r[i - 1]
      end

      while r[i] < n - 1 && a[r[i] + 1] - a[i] <= k
        r[i] += 1
      end
    end

    ans = 0
    (n - 1).times do |i|
      ans += r[i] - i
    end

    puts(ans)
  end
end

Solver.new.solve
