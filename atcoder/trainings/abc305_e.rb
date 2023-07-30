# https://atcoder.jp/contests/abc305/tasks/abc305_e
#
# ■考えたこと
# 警備員のいる頂点からいけるところまでいく。走査中は各頂点で残りの体力を記録していく。重複した点では頂点の体力のmaxで更新する。
# 走査されてない点だけを選んでその周囲に体力が1以上の頂点がないか探し、あれば自分の体力を更新する。
# ダイクストラっぽい感じ。
# ■解説
# ダイクストラっぽいのはわかってたが優先度付ききゅーで処理する頂点の順をうまいこと管理しないといけないのがわからなかった。
# https://atcoder.jp/contests/abc305/tasks/abc305_e/editorial
class PriorityQueue
  # By default, the priority queue returns the maximum element first.
  # If a block is given, the priority between the elements is determined with it.
  # For example, the following block is given, the priority queue returns the minimum element first.
  # `PriorityQueue.new { |x, y| x < y }`
  #
  # A heap is an array for which a[k] <= a[2*k+1] and a[k] <= a[2*k+2] for all k, counting elements from 0.
  def initialize(array = [], &comp)
    @heap = array
    @comp = comp || proc { |x, y| x > y }
    heapify
  end

  def self.max(array)
    new(array)
  end

  def self.min(array)
    new(array) { |x, y| x < y }
  end

  def self.[](*array, &comp)
    new(array, &comp)
  end

  attr_reader :heap
  alias to_a heap

  # Push new element to the heap.
  def push(item)
    shift_down(0, @heap.push(item).size - 1)
    self
  end

  alias << push
  alias append push

  # Pop the element with the highest priority.
  def pop
    latest = @heap.pop
    return latest if empty?

    ret_item = heap[0]
    heap[0] = latest
    shift_up(0)
    ret_item
  end

  # Get the element with the highest priority.
  def get
    @heap[0]
  end

  alias top get
  alias first get

  # Returns true if the heap is empty.
  def empty?
    @heap.empty?
  end

  def size
    @heap.size
  end

  def to_s
    "<#{self.class}: @heap:(#{heap.join(", ")}), @comp:<#{@comp.class} #{@comp.source_location.join(":")}>>"
  end

  private

  def heapify
    (@heap.size / 2 - 1).downto(0) { |i| shift_up(i) }
  end

  def shift_up(pos)
    end_pos = @heap.size
    start_pos = pos
    new_item = @heap[pos]
    left_child_pos = 2 * pos + 1

    while left_child_pos < end_pos
      right_child_pos = left_child_pos + 1
      if right_child_pos < end_pos && @comp.call(@heap[right_child_pos], @heap[left_child_pos])
        left_child_pos = right_child_pos
      end
      # Move the higher priority child up.
      @heap[pos] = @heap[left_child_pos]
      pos = left_child_pos
      left_child_pos = 2 * pos + 1
    end

    @heap[pos] = new_item
    shift_down(start_pos, pos)
  end

  def shift_down(star_pos, pos)
    new_item = @heap[pos]
    while pos > star_pos
      parent_pos = (pos - 1) >> 1
      parent = @heap[parent_pos]
      break if @comp.call(parent, new_item)

      @heap[pos] = parent
      pos = parent_pos
    end

    @heap[pos] = new_item
  end
end

n, m, k = gets.split.map(&:to_i)
g = Array.new(n + 1) { [] }
m.times do
  a, b = gets.split.map(&:to_i)
  g[a] << b
  g[b] << a
end

q = []
pq = PriorityQueue.new { |x, y| x[1] > y[1] }
visited = Array.new(n + 1, -1)
k.times do
  pk, hk = gets.split.map(&:to_i)
  visited[pk] = hk
  pq.push([pk, hk])
end

while pq.empty?.!
  pk, hk = pq.pop
  next if visited[pk] > hk

  g[pk].each do |vi|
    next if visited[vi] >= visited[pk] - 1
    visited[vi] = visited[pk] - 1
    pq.push([vi, visited[vi]])
  end
end

ans = []
visited.each.with_index do |v, i|
  if v >= 0
    ans << i
  end
end

puts(ans.size)
puts(ans.join(" "))
