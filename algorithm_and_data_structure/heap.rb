# Heap with Ruby
class Heap
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

# Test
# #    7
# #  5   6
# # 3 2 1 4
#
# heap = Heap.new
# heap.insert(7)
# heap.insert(5)
# heap.insert(6)
# heap.insert(3)
# heap.insert(2)
# heap.insert(1)
# heap.insert(4)
# p(heap)
# heap.delete
# p(heap)
# heap.insert(8)
# p(heap)
