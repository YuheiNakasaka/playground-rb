# 引き算は割り算とあまりで考えられそう
a, b = gets.split.map(&:to_i)
ans = 0
while a != b && a != 0 && b != 0
  if a < b
    ans += b / a
    b = b % a
    if b % a == 0
      ans -= 1
    end
  elsif a > b
    ans += a / b
    a = a % b
    if a % b == 0
      ans -= 1
    end
  end
end

puts(ans)
