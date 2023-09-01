# https://atcoder.jp/contests/abc283/tasks/abc283_d
#
# ■考えたこと
# いい文字列であることは確定してるので)に対して最大の(は(をスタックとかで管理すれば0(1)もとまる。
# 箱に入れた文字が何回目に入れたのかはmapか何かで管理しておいて、a~z全てを都度チェックすれば良さそう。
# 最大でも26文字なのでO(26 * 3 * 10 ** 5)でPyPyなら余裕だしRubyもまぁ間に合いそう。
# ■解説
#
s = gets.chomp.split("")
stk = []
keys = ("a".."z").to_a
map = keys.map { |c| [c, false] }.to_h
ans = "Yes"
s.size.times do |i|
  if s[i] == "("
    stk.push(i)
  elsif s[i] == ")"
    j = stk.pop
    keys.each do |k|
      next if map[k] == false
      map[k] = false if j <= map[k] && map[k] <= i
    end
  else
    if map[s[i]] != false
      ans = "No"
      break
    end

    map[s[i]] ||= i
  end
end

puts(ans)
