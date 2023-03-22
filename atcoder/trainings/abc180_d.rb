# https://atcoder.jp/contests/abc180/tasks/abc180_d
#
# ■考えたこと
# Xが強さ,Yが強さの上限,特訓で強さは、A倍で経験値+1 or +Bで経験値+1を行える。Yを超えないように経験値の最大値を求める。
# 経験値の増加量はどちらの特訓も同じなのでAXとX+Bのうち小さい方をYを超えないように選ぶだけ?
# AX + AX*A + AX*A*A + ... = X(A + A**2 + A**3 + ... + A**n)
# X + B + B + B + ... = X + Bn
# ■解説
# axの方はYが10**18だとしても2**64程度なので
# まずはax>x+bになるまでaが何回必要かだけ求めて、あとは残りをx+bで割って終わり
# https://atcoder.jp/contests/abc180/editorial/219

x, y, a, b = gets.split.map(&:to_i)
ans = 0
while a * x <= x + b && a * x < y
  x *= a
  ans += 1
end

puts(ans + (y - x - 1) / b)
