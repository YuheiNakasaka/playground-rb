# https://atcoder.jp/contests/abc173/tasks/abc173_c
#
# ■考えたこと
# 制約が小さいので全部列挙していけるか？
# 解ける気がするがむだがあまりにも多そうなので綺麗に解く方法を知りたい
# ■解説
# あーbit全探索か。でもまぁやってることはほぼ同じ。
# https://blog.hamayanhamayan.com/entry/2020/07/05/235310
#
# この回答を見るとRubyならrepeated_permutationという重複順列を作るメソッドで解くのが綺麗そう
# https://atcoder.jp/contests/abc173/submissions/38991896
#
# bit全探索はrepeated_permutationで書くというのは知見だ

H, W, K = gets.split.map(&:to_i)
C = Array.new(H)
sum = 0
cr_cost = Array.new(H) { Array.new(W, 0) }
col_cost = Array.new(W, 0)
row_cost = Array.new(H, 0)
H.times do |i|
  r = gets.chomp.split("")
  r_sum = 0
  W.times do |j|
    if r[j] == "#"
      col_cost[j] += 1
      cr_cost[i][j] = 1
      r_sum += 1
      sum += 1
    end
  end

  row_cost[i] = r_sum
end

row_com = []
1.upto(H) do |c|
  (1..H).to_a.combination(c).each do |cc|
    row_com << cc
  end
end

col_com = []
1.upto(W) do |c|
  (1..W).to_a.combination(c).each do |cc|
    col_com << cc
  end
end

ans = 0
row_com.each do |rw|
  col_com.each do |cl|
    k = 0
    rw.each do |r|
      k += row_cost[r - 1]
    end

    cl.each do |c|
      k += col_cost[c - 1]
    end

    rw.each do |r|
      cl.each do |c|
        k -= cr_cost[r - 1][c - 1]
      end
    end

    if K == sum - k
      ans += 1
    end
  end
end

row_com.each do |rw|
  k = 0
  rw.each do |r|
    k += row_cost[r - 1]
  end

  if K == sum - k
    ans += 1
  end
end

col_com.each do |cl|
  k = 0
  cl.each do |c|
    k += col_cost[c - 1]
  end

  if K == sum - k
    ans += 1
  end
end

if K == sum
  ans += 1
end

puts(ans)
