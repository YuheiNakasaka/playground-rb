# https://atcoder.jp/contests/abc181/tasks/abc181_c
#
# ■考えたこと
# x,yの点で集計して同じx,yを持つ点が3つ以上あるか数える -> だめ。斜めの直線もあった。
# 制約小さいので全探索する
# ■解説
# 傾きを求めるときの0除算は掛け算に直せばよい
# https://atcoder.jp/contests/abc181/editorial/258
N = gets.to_i
dots = []
N.times do |i|
  dots << gets.split.map(&:to_i)
end

ans = "No"
N.times do |i|
  N.times do |j|
    next if i == j
    N.times do |k|
      next if i == k || j == k
      a = dots[i]
      b = dots[j]
      c = dots[k]

      # これでも良い。0除算の場合を変に考慮しなくて良い
      # y1 = (a[1].to_f - b[1])
      # x1 = (a[0] - b[0])
      # y2 = (c[1].to_f - b[1])
      # x2 = (c[0] - b[0])
      # if y1 * x2 == y2 * x1
      #   ans = 'Yes'
      #   break
      # end

      is_on_line1 = a[0] - b[0] == 0 ? 10 ** 9 : (a[1].to_f - b[1]) / (a[0] - b[0])
      is_on_line2 = c[0] - b[0] == 0 ? 10 ** 9 : (c[1].to_f - b[1]) / (c[0] - b[0])
      if is_on_line1 == is_on_line2
        ans = "Yes"
        break
      end
    end
  end
end

puts(ans)
