# https://atcoder.jp/contests/abc307/tasks/abc307_d
#
# ■考えたこと
# スタック使って良い感じにやるだけ？
# ■解説
#
n = gets.to_i
s = gets.chomp.split("")
stack = []
start_cnt = 0
n.times do |i|
  if s[i] == ")" && start_cnt > 0
    stack.push(s[i])
    while stack.empty?.!
      ch = stack.pop
      if ch == "("
        start_cnt -= 1
        break
      end
    end
  else
    start_cnt += 1 if s[i] == "("
    stack.push(s[i])
  end
end

puts(stack.join(""))
