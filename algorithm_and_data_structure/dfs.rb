# 深さ優先探索(Depth First Search)
N = 9
G = []

N.times do
  G.push([])
end

# 無向グラフ
G[0] = [1, 4, 2]
G[1] = [0, 4, 3, 8]
G[2] = [0, 5]
G[3] = [1, 8, 7]
G[4] = [0, 1, 8]
G[5] = [2, 8, 6]
G[6] = [5, 7]
G[7] = [3, 6]
G[8] = [1, 3, 4, 5]

# 基本形。訪れた場所をtrueにする。
def search(s)
  n = G.length
  seen = (0...n).map { |i| false }
  stack = []

  seen[s] = true
  stack.push(s)

  while !stack.empty?
    v = stack.last
    stack.pop

    G[v].map do |x|
      next if seen[x]
      seen[x] = true
      stack.push(x)
    end
  end

  seen
end

seen = search(0)
N.times do |i|
  puts("#{i}: #{seen[i]}")
end
