# https://atcoder.jp/contests/abc323/tasks/abc323_c
#
# ■考えたこと
#
# ■解説
#
n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
asort = a.map.with_index { |e, i| [e, i] }.sort_by { |e| e[0] + (e[1] / 10.0) }.reverse
scores = []
top_score = 0
result = []
n.times do |i|
  score = 0
  answered = gets.chomp.split('')
  answered.each.with_index do |s, j|
    score += a[j] if s == 'o'
  end
  result << answered
  score += i
  top_score = score if score >= top_score
  scores << score
end

ans = []
n.times do |i|
  d = top_score - scores[i]
  if d <= 0
    ans << 0
    next
  end

  cnt = 0
  asort.each.with_index do |e, j|
    if result[i][e[1]] != 'o'
      d -= e[0]
      cnt += 1
      if d.negative?
        ans << cnt
        break
      end
    end
  end
end

ans.each do |e|
  puts e
end
