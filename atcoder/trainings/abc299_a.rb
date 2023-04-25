# https://atcoder.jp/contests/abc299/tasks/abc299_a
#
# ■考えたこと
#
# ■解説
#
N = gets.to_i
S = gets.chomp
status = false
is_ast = false
S.each_char do |c|
  if c == "|" && status
    status = false
    if is_ast
      puts("in")
      exit
    end
  end

  if c == "|" && status.!
    status = true
  end

  if c == "*" && status
    is_ast = true
  end
end

puts("out")
