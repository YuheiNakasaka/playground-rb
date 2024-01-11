# frozen_string_literal: true

# https://atcoder.jp/contests/abc335/tasks/abc335_d
#
# ■考えたこと
#
# ■解説
#
@n = gets.to_i
@g = Array.new(@n) { Array.new(@n, nil) }
@g[@n / 2][@n / 2] = 'T'
@priorities = [[0, 1], [1, 0], [0, -1], [-1, 0]]
@i = 1
@switch = 'r'

def dfs(y, x)
  return if @g[y][x] == 'T'

  return unless @g[y][x].nil?

  @g[y][x] = @i
  @i += 1

  case @switch
  when 'r'
    if x + 1 >= 0 && x + 1 < @n && @g[y][x + 1].nil?
      dfs(y, x + 1)
    else
      @switch = 'd'
      dfs(y + 1, x)
    end
  when 'd'
    if y + 1 >= 0 && y + 1 < @n && @g[y + 1][x].nil?
      dfs(y + 1, x)
    else
      @switch = 'l'
      dfs(y, x - 1)
    end
  when 'l'
    if x - 1 >= 0 && x - 1 < @n && @g[y][x - 1].nil?
      dfs(y, x - 1)
    else
      @switch = 'u'
      dfs(y - 1, x)
    end
  when 'u'
    if y - 1 >= 0 && y - 1 < @n && @g[y - 1][x].nil?
      dfs(y - 1, x)
    else
      @switch = 'r'
      dfs(y, x + 1)
    end
  end
end

dfs(0, 0)

@g.each do |row|
  # puts row.map { |o| o == 'T' ? 'TTTT' : format('%04d', o) }.join(' ')
  puts row.join(' ')
end
