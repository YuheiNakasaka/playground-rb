# https://atcoder.jp/contests/abc179/tasks/abc179_c
#
# ■考えたこと
#
# ■解説
# A * B + C = Nを満たすA, B, Cの組み合わせの個数を求める問題
# Nが決まっている場合、A * B + C = Nを満たすCはちょうど一つのみ。ということは結局A*Bの組み合わせの個数を求める問題になる。
# 従ってAを固定してB = N-1/A(1つに定まるので。要はCは考えなくて良い。)を求めるだけ。これはO(1)なので全体でO(N)で解ける。
# https://atcoder.jp/contests/abc179/editorial/99

# 高速素因数分解
# spf: xを素因数分解したときの最小の素数
# cnt: x = a * bを満たすa, bの組み合わせの個数
#
# 使い方
# n = 60
# spf = SmallestPrimeFactors.new(n)
# spf.factolize(x) # => [2, 2, 3, 5]
# spf.cnt # => 12
class SmallestPrimeFactors
  attr_accessor :spf, :cnt

  def initialize(n)
    @n = n
    @spf = Array.new(n + 1, 0)
    @cnt = 1
    init_spf
  end

  def factolize(x)
    @cnt = 1
    res = []
    prev = @spf[x]
    e = 0
    while x != 1
      if prev != @spf[x]
        @cnt *= e + 1
        prev = @spf[x]
        e = 0
      end

      e += 1
      res << @spf[x]
      x /= @spf[x]
    end

    @cnt *= e + 1

    res.sort
  end

  def init_spf
    (@n + 1).times do |i|
      @spf[i] = i
    end

    i = 2
    while i * i <= @n
      if @spf[i] == i
        j = i * i
        while j <= @n
          if @spf[j] == j
            @spf[j] = i
          end

          j += i
        end
      end

      i += 1
    end
  end
end

spf = SmallestPrimeFactors.new(10 ** 6)
N = gets.to_i
ans = 0
1.upto(N) do |c|
  ab = N - c
  break if ab <= 0
  spf.factolize(ab)
  ans += spf.cnt
  sum = 1
end

puts(ans)
