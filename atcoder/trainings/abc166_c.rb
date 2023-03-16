# https://atcoder.jp/contests/abc166/tasks/abc166_c
#
# ■考えたこと
# 展望台を一つずつ見ていってそこからつながる他の展望台の高さを調べていく
# つながる他の展望台と高さを比べるところの計算量をどう減らすかだが、heapとか使えば良いだろう
# ■解説
# 通った。が、heapとか使わんでも展望台の周りにつながる展望台の高さの最大値をmaxで求めておいて、最後にHとそのmaxを比較すれば良かった。
# https://img.atcoder.jp/abc166/editorial.pdf
class Heap
  attr_accessor :heap

  def initialize
    @heap = []
  end

  def insert(value)
    @heap << value
    i = @heap.size - 1
    while i > 0
      parent = (i - 1) / 2
      if @heap[parent] < @heap[i]
        @heap[parent], @heap[i] = @heap[i], @heap[parent]
        i = parent
      else
        break
      end
    end
  end

  def delete
    return nil if @heap.empty?
    return @heap.pop if @heap.size == 1
    max = @heap[0]
    @heap[0] = @heap.pop
    i = 0
    while i < @heap.size
      child1 = i * 2 + 1
      child2 = i * 2 + 2
      if child1 >= @heap.size
        break
      elsif child2 >= @heap.size
        if @heap[i] < @heap[child1]
          @heap[i], @heap[child1] = @heap[child1], @heap[i]
          i = child1
        else
          break
        end
      else
        if @heap[child1] > @heap[child2]
          if @heap[i] < @heap[child1]
            @heap[i], @heap[child1] = @heap[child1], @heap[i]
            i = child1
          else
            break
          end
        else
          if @heap[i] < @heap[child2]
            @heap[i], @heap[child2] = @heap[child2], @heap[i]
            i = child2
          else
            break
          end
        end
      end
    end

    max
  end
end

N, M = gets.split.map(&:to_i)
H = gets.split.map(&:to_i)
g = Array.new(N) { Heap.new }
M.times do |i|
  a, b = gets.split.map(&:to_i)
  a -= 1
  b -= 1
  g[a].insert(H[b])
  g[b].insert(H[a])
end

ans = 0
N.times do |i|
  if g[i].heap.empty? || H[i] > g[i].heap[0]
    ans += 1
  end
end

puts(ans)
