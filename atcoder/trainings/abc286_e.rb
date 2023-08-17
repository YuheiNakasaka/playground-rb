# https://atcoder.jp/contests/abc286/tasks/abc286_e
#
# ■考えたこと
# 条件多すぎてだるい。qごとにダイクストラの応用かな。TLEは怖いが。
# 普通にTLEした。O(Q*(M+N))くらいじゃ無いのか...。
# ■解説
# ワーシャルフロイドかダイクストラを無駄を省いてやるといける
# が、RubyだとTLEになるのでだめでした...というオチ
# https://atcoder.jp/contests/abc286/tasks/abc286_e/editorial
n = gets.to_i
a = gets.split.map(&:to_i)
g = Array.new(n) { Array.new(n) { [10 ** 18, 0] } }
n.times do |i|
  g[i][i] = [0, 0]
  s = gets.chomp.split("")
  n.times do |j|
    if s[j] == "Y"
      g[i][j] = [1, -a[j]]
    end
  end
end

n.times do |k|
  n.times do |i|
    n.times do |j|
      if g[i][k][0] + g[k][j][0] < g[i][j][0]
        g[i][j] = [g[i][k][0] + g[k][j][0], g[i][k][1] + g[k][j][1]]
      elsif g[i][k][0] + g[k][j][0] == g[i][j][0] && g[i][k][1] + g[k][j][1] < g[i][k][1]
        g[i][j] = [g[i][k][0] + g[k][j][0], g[i][k][1] + g[k][j][1]]
      end
    end
  end
end

q = gets.to_i
ans = []
q.times do
  s, t = gets.split.map(&:to_i)
  s -= 1
  t -= 1
  dist, val = g[s][t]
  if dist == 10 ** 18
    ans << "Impossible"
  else
    ans << "#{dist} #{a[s] - val}"
  end
end

ans.each do |an|
  puts(an)
end
