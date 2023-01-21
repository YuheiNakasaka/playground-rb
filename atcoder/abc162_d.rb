# https://atcoder.jp/contests/abc162/tasks/abc162_d
#
# 条件
# Si != Sj && Si != Sk && Sj != Sk
# j - i != k - j
#
# 基本方針
# 重複しない全てのRGBの組み合わせから下記の条件を満たさないものを除く
# k != j - i + j
N = gets.to_s.to_i
S = gets.to_s.split("")

total_r = 0
total_g = 0
total_b = 0

S.each do |c|
  total_r += 1 if c == "R"
  total_g += 1 if c == "G"
  total_b += 1 if c == "B"
end

total_rbg = total_r * total_g * total_b

(0..(N - 1)).each do |i|
  ((i + 1)..(N - 1)).each do |j|
    # 条件を満たさないkを求める
    k = j - i + j
    next if k >= N

    # 条件を満たさないi,j,kに基づいてSが全て重複しない場合はtotal_rbgから1を引く
    if S[i] != S[j] && S[i] != S[k] && S[j] != S[k]
      total_rbg -= 1
    end
  end
end

puts(total_rbg)

# N = 4000
# S = (0..N).map { |i| ["R", "G", "B"][i % 3] }

# # RGだけのarrayを作る
# # O(N^2)
# rg_array = []
# S.each_with_index do |r, i|
#   next if r != "R"
#   S.each_with_index do |g, j|
#     next if g != "G"
#     if i > j
#       rg_array << [j, i]
#     else
#       rg_array << [i, j]
#     end
#   end
# end

# p(rg_array.length)

# # RGのarrayとBの位置を比較して、条件を満たすかどうかを調べる
# # O(N^2)
# ans = 0
# rg_array.each do |rg|
#   #   S.each_with_index do |b, k|
#   #     next if b != "B"
#   #     a = rg[0]
#   #     b = rg[1]

#   #     # k < a < b
#   #     if k < a
#   #       if a - k != b - a
#   #         ans += 1
#   #       end
#   #       # a < b < k
#   #     elsif k > b
#   #       if b - k != a - b
#   #         ans += 1
#   #       end
#   #       # a < k < b
#   #     elsif a < k && k < b
#   #       if k - a != b - k
#   #         ans += 1
#   #       end
#   #     end
#   #   end
# end

# puts(ans)
