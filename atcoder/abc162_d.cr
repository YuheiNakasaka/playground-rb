# # https://atcoder.jp/contests/abc162/tasks/abc162_d
n = read_line.to_i
s = read_line.split("")

# RGだけのarrayを作る
# O(N^2)
rg_array = [] of Array(Int32)
s.each_with_index do |r, i|
  next if r != "R"
  s.each_with_index do |g, j|
    next if g != "G"
    if i > j
      rg_array << [j, i]
    else
      rg_array << [i, j]
    end
  end
end

# RGのarrayとBの位置を比較して、条件を満たすかどうかを調べる
# O(N^2)
ans = 0
rg_array.each do |rg|
  s.each_with_index do |b, k|
    next if b != "B"
    a = rg[0]
    b = rg[1]

    # k < a < b
    if k < a
      if a - k != b - a
        ans += 1
      end
      # a < b < k
    elsif k > b
      if b - k != a - b
        ans += 1
      end
      # a < k < b
    elsif a < k && k < b
      if k - a != b - k
        ans += 1
      end
    end
  end
end

puts ans
