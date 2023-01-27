# 区間スケジューリング
# あとにより多くの選択肢を残せるようにするのが肝。
#
# 貪欲法の典型問題。終了時間の早い順に選択していく。
# https://algo-method.com/tasks/363/editorial

# 例
# 4
# 10 20
# 12 15
# 15 18
# 20 22

N = gets.to_i
a = []
N.times do
  a << gets.split.map(&:to_i)
end

a.sort_by! { |x| x[1] }

i = 1
cnt = 1
x = a[0]
while i < N
  # 終了時間より開始時間が同じか遅いものだけ選択
  if x[1] <= a[i][0]
    cnt += 1
    x = a[i]
  end

  i += 1
end

puts(cnt)
