# https://atcoder.jp/contests/abc217/tasks/abc217_d
#
# ■考えたこと
# MySortedSetを使うテスト
# ■解説
#
require "set"

class MySortedSet
  attr_accessor :arr

  BUCKET_RATIO = 50.0
  REBUILD_RATIO = 170.0

  def initialize(arr)
    arr = arr.to_a
    build(init_arr(arr))
  end

  def add(x)
    if @size == 0
      @arr = [[x]]
      @size = 1
      return true
    end

    arr = find_bucket(x)
    i = bisect_left(arr, x)
    return false if i != arr.length && arr[i] == x

    arr.insert(i, x)
    @size += 1

    if arr.length > @arr.length * REBUILD_RATIO
      build
    end

    true
  end

  def discard(x)
    return false if @size == 0
    arr = find_bucket(x)
    i = bisect_left(arr, x)
    return false if i == arr.length || arr[i] != x
    arr.delete_at(i)
    @size -= 1
    build if arr.length == 0
    true
  end

  def lt(x)
    @arr.reverse.each do |a|
      if a[0] < x
        return a[bisect_left(a, x) - 1]
      end
    end

    nil
  end

  def le(x)
    @arr.reverse.each do |a|
      if a[0] <= x
        return a[bisect_right(a, x) - 1]
      end
    end

    nil
  end

  def gt(x)
    @arr.each do |a|
      if a[-1] > x
        return a[bisect_right(a, x)]
      end
    end

    nil
  end

  def ge(x)
    @arr.each do |a|
      if a[-1] >= x
        return a[bisect_left(a, x)]
      end
    end

    nil
  end

  def index(x)
    ans = 0
    @arr.each do |a|
      if a[-1] >= x
        return ans + bisect_left(a, x)
      end

      ans += a.length
    end

    ans
  end

  def index_right(x)
    ans = 0
    @arr.each do |a|
      if a[-1] > x
        return ans + bisect_right(a, x)
      end

      ans += a.length
    end

    ans
  end

  private
  def init_arr(arr)
    is_sorted = true
    (arr.length - 1).times do |i|
      if arr[i] >= arr[i + 1]
        is_sorted = false
        break
      end
    end

    if !is_sorted
      arr = Set.new(arr).sort
    end

    arr
  end

  def build(arr = nil)
    if arr.nil?
      arr = @arr.flatten
    end

    @size = arr.length
    bucket_size = Math.sqrt(@size / BUCKET_RATIO).ceil.to_i
    @arr = [].tap do |buckets|
      bucket_size.times do |i|
        buckets << arr[(@size * i / bucket_size)..(@size * (i + 1) / bucket_size)]
      end

      buckets
    end
  end

  def find_bucket(x)
    arr = []
    @arr.each do |a|
      return a if x <= a[-1]
    end

    arr
  end

  def bisect_right(a, x, lo = 0, hi = nil)
    if lo < 0
      raise "lo must be non-negative"
    end

    if hi.nil?
      hi = a.length
    end

    while lo < hi
      mid = (lo + hi) / 2
      if x < a[mid]
        hi = mid
      else
        lo = mid + 1
      end
    end

    return lo
  end

  def bisect_left(a, x, lo = 0, hi = nil)
    if lo < 0
      raise "lo must be non-negative"
    end

    if hi.nil?
      hi = a.length
    end

    while lo < hi
      mid = (lo + hi) / 2
      if a[mid] < x
        lo = mid + 1
      else
        hi = mid
      end
    end

    return lo
  end
end

L, Q = gets.split.map(&:to_i)
s = MySortedSet.new([0, L])
ans = []
Q.times do |i|
  c, x = gets.split.map(&:to_i)
  if c == 1
    s.add(x)
  else
    ans << s.gt(x) - s.lt(x)
  end
end

ans.each do |a|
  puts(a)
end
