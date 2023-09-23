# https://atcoder.jp/contests/abc321/tasks/abc321_c
#
# ■考えたこと
#
# ■解説
#
# クソ実装version
K = gets.to_i
cnt = 0

ans = []
idx = 0
1.upto(9) do |i|
  ans << i
end

1.upto(9) do |i|
  0.upto(9) do |j|
    break unless i > j

    ans << 10 * i + j
  end
end

1.upto(9) do |i|
  0.upto(9) do |j|
    break unless i > j

    0.upto(9) do |k|
      break unless j > k

      ans << 100 * i + 10 * j + k
    end
  end
end

1.upto(9) do |i|
  0.upto(9) do |j|
    break unless i > j

    0.upto(9) do |k|
      break unless j > k

      0.upto(9) do |l|
        break unless k > l

        ans << 1000 * i + 100 * j + 10 * k + l
      end
    end
  end
end

1.upto(9) do |i|
  0.upto(9) do |j|
    break unless i > j

    0.upto(9) do |k|
      break unless j > k

      0.upto(9) do |l|
        break unless k > l

        0.upto(9) do |m|
          break unless l > m

          ans << 10_000 * i + 1000 * j + 100 * k + 10 * l + m
        end
      end
    end
  end
end

1.upto(9) do |i|
  0.upto(9) do |j|
    break unless i > j

    0.upto(9) do |k|
      break unless j > k

      0.upto(9) do |l|
        break unless k > l

        0.upto(9) do |m|
          break unless l > m

          0.upto(9) do |n|
            break unless m > n

            ans << 100_000 * i + 10_000 * j + 1000 * k + 100 * l + 10 * m + n
          end
        end
      end
    end
  end
end

1.upto(9) do |i|
  0.upto(9) do |j|
    break unless i > j

    0.upto(9) do |k|
      break unless j > k

      0.upto(9) do |l|
        break unless k > l

        0.upto(9) do |m|
          break unless l > m

          0.upto(9) do |n|
            break unless m > n

            0.upto(9) do |o|
              break unless n > o

              ans << 1_000_000 * i + 100_000 * j + 10_000 * k + 1000 * l + 100 * m + 10 * n + o
            end
          end
        end
      end
    end
  end
end

1.upto(9) do |i|
  0.upto(9) do |j|
    break unless i > j

    0.upto(9) do |k|
      break unless j > k

      0.upto(9) do |l|
        break unless k > l

        0.upto(9) do |m|
          break unless l > m

          0.upto(9) do |n|
            break unless m > n

            0.upto(9) do |o|
              break unless n > o

              0.upto(9) do |p|
                break unless o > p

                ans << 10_000_000 * i + 1_000_000 * j + 100_000 * k + 10_000 * l + 1000 * m + 100 * n + 10 * o + p
              end
            end
          end
        end
      end
    end
  end
end

1.upto(9) do |i|
  0.upto(9) do |j|
    break unless i > j

    0.upto(9) do |k|
      break unless j > k

      0.upto(9) do |l|
        break unless k > l

        0.upto(9) do |m|
          break unless l > m

          0.upto(9) do |n|
            break unless m > n

            0.upto(9) do |o|
              break unless n > o

              0.upto(9) do |p|
                break unless o > p

                0.upto(9) do |q|
                  break unless p > q

                  ans << 100_000_000 * i + 10_000_000 * j + 1_000_000 * k + 100_000 * l + 10_000 * m + 1000 * n + 100 * o + 10 * p + q
                end
              end
            end
          end
        end
      end
    end
  end
end

1.upto(9) do |i|
  0.upto(9) do |j|
    break unless i > j

    0.upto(9) do |k|
      break unless j > k

      0.upto(9) do |l|
        break unless k > l

        0.upto(9) do |m|
          break unless l > m

          0.upto(9) do |n|
            break unless m > n

            0.upto(9) do |o|
              break unless n > o

              0.upto(9) do |p|
                break unless o > p

                0.upto(9) do |q|
                  break unless p > q

                  0.upto(9) do |r|
                    break unless q > r

                    ans << 1_000_000_000 * i + 100_000_000 * j + 10_000_000 * k + 1_000_000 * l + 100_000 * m + 10_000 * n + 1000 * o + 100 * p + 10 * q + r
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

puts ans[K - 1]
