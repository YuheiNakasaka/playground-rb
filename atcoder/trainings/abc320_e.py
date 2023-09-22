import heapq

class PriorityQueue:
    def __init__(self, array=None, comp=None):
        self.heap = array if array else []
        self.comp = comp if comp else lambda x, y: x > y
        self.heapify()

    @classmethod
    def max(cls, array):
        return cls(array)

    @classmethod
    def min(cls, array):
        return cls(array, lambda x, y: x < y)

    @classmethod
    def from_list(cls, array, comp=None):
        return cls(array, comp)

    @property
    def to_list(self):
        return self.heap

    def push(self, item):
        heapq.heappush(self.heap, item)
        return self

    def append(self, item):
        return self.push(item)

    def pop(self):
        if not self.empty():
            ret_item = self.heap[0]
            heapq.heappop(self.heap)
            return ret_item
        else:
            return None

    def get(self):
        if not self.empty():
            return self.heap[0]
        else:
            return None

    @property
    def top(self):
        return self.get()

    @property
    def first(self):
        return self.get()

    def empty(self):
        return not bool(self.heap)

    def size(self):
        return len(self.heap)

    def __str__(self):
        return f"<{self.__class__.__name__}: @heap:({', '.join(map(str, self.heap))}), @comp:{self.comp}>"

    def heapify(self):
        heapq.heapify(self.heap)

    def shift_up(self, pos):
        end_pos = len(self.heap)
        start_pos = pos
        new_item = self.heap[pos]
        left_child_pos = 2 * pos + 1

        while left_child_pos < end_pos:
            right_child_pos = left_child_pos + 1
            if right_child_pos < end_pos and self.comp(self.heap[right_child_pos], self.heap[left_child_pos]):
                left_child_pos = right_child_pos
            # Move the higher priority child up.
            self.heap[pos] = self.heap[left_child_pos]
            pos = left_child_pos
            left_child_pos = 2 * pos + 1

        self.heap[pos] = new_item
        self.shift_down(start_pos, pos)

    def shift_down(self, star_pos, pos):
        new_item = self.heap[pos]
        while pos > star_pos:
            parent_pos = (pos - 1) >> 1
            parent = self.heap[parent_pos]
            if not self.comp(parent, new_item):
                self.heap[pos] = parent
                pos = parent_pos
            else:
                break

        self.heap[pos] = new_item


n, m = map(int, input().split())
tws = []
for i in range(m):
    tws.append(list(map(int, input().split())))

quantities = [0] * (n + 1)
humans = PriorityQueue(list(range(1, n + 1)), lambda x, y: x < y)
eatings = PriorityQueue([])

for i in range(m):
    t, w, s = tws[i]

    while not eatings.empty():
        eated = eatings.get()
        if not eated or eated[0] > t:
            break

        eated = eatings.pop()
        humans.append(eated[1])

    head = humans.pop()

    if head is not None:
        quantities[head] += w
        eatings.append([t + s, head])

for i in range(1, n + 1):
    print(quantities[i])
