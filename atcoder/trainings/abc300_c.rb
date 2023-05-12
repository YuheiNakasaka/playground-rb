# https://atcoder.jp/contests/abc300/tasks/abc300_c
#
# ■考えたこと
# 全探索するだけ。注意としてはバツ印の四方の斜めを判定をするときに内側に#がないかどうかをチェックすること。
# ■解説
# https://atcoder.jp/contests/abc300/editorial/6280
H, W = gets.split.map(&:to_i)
g = Array.new(H)
H.times do |h|
  row = gets.chomp.split("")
  g[h] = row
end

hash = {}
H.times do |h|
  W.times do |w|
    if g[h][w] == "#"
      t = 0
      1.upto(51) do |i|
        if h -
            i >= 0 &&
            w - i >= 0 &&
            w + i < W &&
            h + i < H &&
            (g[h - i][w - i] == "#" && g[h - i][w - i + 1] != "#") &&
            (g[h - i][w + i] == "#" && g[h - i][w + i - 1] != "#") &&
            (g[h + i][w - i] == "#" && g[h + i][w - i + 1] != "#") &&
            (g[h + i][w + i] == "#" && g[h + i][w + i - 1] != "#") &&
            t = i
          next
        else
          break
        end
      end

      if t > 0
        hash[t] ||= 0
        hash[t] += 1
      end
    end
  end
end

ans = []
(1..([H, W].min)).each do |k|
  ans << (hash[k] || 0)
end

puts(ans.join(" "))
