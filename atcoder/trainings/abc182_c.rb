# https://atcoder.jp/contests/abc182/tasks/abc182_c
#
# ■考えたこと
#
# ■解説
#
n = gets.chomp
nums = n.split("").map(&:to_i)
n = n.to_i
lim = nums.size - 1
if nums.size < 2 && n % 3 != 0
  puts("-1")
  exit
end

if n % 3 == 0
  puts("0")
  exit
elsif n % 3 == 1
  nums.each do |num|
    if num % 3 == 1
      puts("1")
      exit
    end
  end

  tmp = 0
  nums.each do |num|
    if num % 3 == 2
      tmp += 1
      if tmp == 2 && lim >= tmp
        puts("2")
        exit
      end
    end
  end
elsif n % 3 == 2
  nums.each do |num|
    if num % 3 == 2
      puts("1")
      exit
    end
  end

  tmp = 0
  nums.each do |num|
    if num % 3 == 1
      tmp += 1
      if tmp == 2 && lim >= tmp
        puts("2")
        exit
      end
    end
  end
end

puts("-1")
