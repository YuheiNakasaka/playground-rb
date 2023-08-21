# https://atcoder.jp/contests/abc315/tasks/abc315_c
#
# ■考えたこと
#
# ■解説
# https://atcoder.jp/contests/abc315/tasks/abc315_c/editorial
class PriorityQueue
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

n = gets.to_i
ft = Array.new(n)
pq = Array.new(n) { PriorityQueue.new }
n.times do |i|
  f, t = gets.split.map(&:to_i)
  ft[i] = [f - 1, t]
  pq[ft[i][0]] << ft[i][1]
end

ft.sort_by! { |f, t| [-t, f] }

ans = 0
max_f, max_t = ft[0]
if pq[max_f].size >= 2
  pq[max_f].pop
  second_max_t = pq[max_f].pop
  ans = max_t + second_max_t / 2
end

n.times do |i|
  next if i == max_f
  if pq[i].size > 0
    t = pq[i].pop
    ans = [ans, max_t + t].max
  end
end

puts(ans)
