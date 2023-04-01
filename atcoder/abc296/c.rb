# Ai - Aj = X となるようなAi, Ajの組み合わせが存在するか調べる
# 全探索すると0(N^2)で間に合わないので、
N, X = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

h = {}
N.times do |i|
  h[A[i] - X] = true
end

ans = "No"
N.times do |i|
  if h[A[i]] == true
    ans = "Yes"
    break
  end
end

puts(ans)
