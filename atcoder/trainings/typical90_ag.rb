# https://atcoder.jp/contests/typical90/tasks/typical90_ag
# ■考えたこと
# 順番にマス目を走査&チェックするだけ
# 制約が1<=H,W<=100だが、h=1,w=1の時はどう出力するのが正解なんだろうか？
#
# 解説。コーナーケースを考慮するやつ。てかそもそも通常ケースの解答ももっと簡単にできて、H/2 + W/2でよかった。
# https://twitter.com/e869120/status/1390436977808351234/photo/1

H, W = gets.split.map(&:to_i)

led = Array.new(H) { Array.new(W, false) }

H.times do |h|
  W.times do |w|
    is_ok = true
    [1, 0, -1].each do |dh|
      [1, 0, -1].each do |dw|
        next if dh == 0 && dw == 0
        hh = h + dh
        ww = w + dw
        if 0 <= hh && hh < H && 0 <= ww && ww < W && led[h + dh][w + dw]
          is_ok = false
        end
      end
    end

    if is_ok
      led[h][w] = true
    end
  end
end

ans = 0
H.times do |h|
  W.times do |w|
    if led[h][w]
      ans += 1
    end
  end
end

if W == 1 || H == 1
  puts(W * H)
else
  puts(ans)
end
