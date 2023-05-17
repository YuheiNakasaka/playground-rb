# https://atcoder.jp/contests/abc198/tasks/abc198_d
#
# ■考えたこと
# 全ての文字に対して1対1で数字を割り当てて、|S1|+|S2|=|S3|にしたいという問題か。
# 5secだし文字数は1~10文字なので割り当てる数字を変えながら全探索していく感じかな。
# TLEになるが解ける実装はできた。入力例5が12秒くらいになるからオーダーを落とす必要がある。10**7くらい？
# 5.5secくらいになったので、もう少し改善すればいける。これRubyじゃなければ多分通ってるな...
# 明らかに不要な計算になる処理はskip、内部のloopを全てinline化、powを何度も計算しないようにするあたりを詰めて通った。
# ■解説
# 気合いで通したけどちゃんとした解放ではない
# https://atcoder.jp/contests/abc198/tasks/abc198_d/editorial
require "set"

S1 = gets.chomp.chars
S2 = gets.chomp.chars
S3 = gets.chomp.chars
alpha = {}
(S1 + S2 + S3).each do |s|
  alpha[s] = 0
end

alpha_keys = alpha.keys
alpha_kind = alpha_keys.length
if alpha_kind > 10
  puts("UNSOLVABLE")
  exit
end

s1_size = S1.size
s2_size = S2.size
s3_size = S3.size
s1_pow_0 = 10.pow(s1_size - 1 - 0) unless S1[0].nil?
s1_pow_1 = 10.pow(s1_size - 1 - 1) unless S1[1].nil?
s1_pow_2 = 10.pow(s1_size - 1 - 2) unless S1[2].nil?
s1_pow_3 = 10.pow(s1_size - 1 - 3) unless S1[3].nil?
s1_pow_4 = 10.pow(s1_size - 1 - 4) unless S1[4].nil?
s1_pow_5 = 10.pow(s1_size - 1 - 5) unless S1[5].nil?
s1_pow_6 = 10.pow(s1_size - 1 - 6) unless S1[6].nil?
s1_pow_7 = 10.pow(s1_size - 1 - 7) unless S1[7].nil?
s1_pow_8 = 10.pow(s1_size - 1 - 8) unless S1[8].nil?
s1_pow_9 = 10.pow(s1_size - 1 - 9) unless S1[9].nil?
s2_pow_0 = 10.pow(s2_size - 1 - 0) unless S2[0].nil?
s2_pow_1 = 10.pow(s2_size - 1 - 1) unless S2[1].nil?
s2_pow_2 = 10.pow(s2_size - 1 - 2) unless S2[2].nil?
s2_pow_3 = 10.pow(s2_size - 1 - 3) unless S2[3].nil?
s2_pow_4 = 10.pow(s2_size - 1 - 4) unless S2[4].nil?
s2_pow_5 = 10.pow(s2_size - 1 - 5) unless S2[5].nil?
s2_pow_6 = 10.pow(s2_size - 1 - 6) unless S2[6].nil?
s2_pow_7 = 10.pow(s2_size - 1 - 7) unless S2[7].nil?
s2_pow_8 = 10.pow(s2_size - 1 - 8) unless S2[8].nil?
s2_pow_9 = 10.pow(s2_size - 1 - 9) unless S2[9].nil?
s3_pow_0 = 10.pow(s3_size - 1 - 0) unless S3[0].nil?
s3_pow_1 = 10.pow(s3_size - 1 - 1) unless S3[1].nil?
s3_pow_2 = 10.pow(s3_size - 1 - 2) unless S3[2].nil?
s3_pow_3 = 10.pow(s3_size - 1 - 3) unless S3[3].nil?
s3_pow_4 = 10.pow(s3_size - 1 - 4) unless S3[4].nil?
s3_pow_5 = 10.pow(s3_size - 1 - 5) unless S3[5].nil?
s3_pow_6 = 10.pow(s3_size - 1 - 6) unless S3[6].nil?
s3_pow_7 = 10.pow(s3_size - 1 - 7) unless S3[7].nil?
s3_pow_8 = 10.pow(s3_size - 1 - 8) unless S3[8].nil?
s3_pow_9 = 10.pow(s3_size - 1 - 9) unless S3[9].nil?

(0..9).to_a.permutation(alpha_kind).each do |nums|
  alpha[alpha_keys[0]] = nums[0] unless alpha_keys[0].nil?
  alpha[alpha_keys[1]] = nums[1] unless alpha_keys[1].nil?
  alpha[alpha_keys[2]] = nums[2] unless alpha_keys[2].nil?
  alpha[alpha_keys[3]] = nums[3] unless alpha_keys[3].nil?
  alpha[alpha_keys[4]] = nums[4] unless alpha_keys[4].nil?
  alpha[alpha_keys[5]] = nums[5] unless alpha_keys[5].nil?
  alpha[alpha_keys[6]] = nums[6] unless alpha_keys[6].nil?
  alpha[alpha_keys[7]] = nums[7] unless alpha_keys[7].nil?
  alpha[alpha_keys[8]] = nums[8] unless alpha_keys[8].nil?
  alpha[alpha_keys[9]] = nums[9] unless alpha_keys[9].nil?

  # 頭文字0だとだめ
  next if alpha[S1[0]] == 0 || alpha[S2[0]] == 0 || alpha[S3[0]] == 0
  # S1+S2=S3で末尾の和が一致しないとだめ
  next if (alpha[S1[S1.size - 1]] + alpha[S2[S2.size - 1]]) % 10 != alpha[S3[S3.size - 1]] % 10

  s1 = 0
  s1 += alpha[S1[0]] * s1_pow_0 unless S1[0].nil?
  s1 += alpha[S1[1]] * s1_pow_1 unless S1[1].nil?
  s1 += alpha[S1[2]] * s1_pow_2 unless S1[2].nil?
  s1 += alpha[S1[3]] * s1_pow_3 unless S1[3].nil?
  s1 += alpha[S1[4]] * s1_pow_4 unless S1[4].nil?
  s1 += alpha[S1[5]] * s1_pow_5 unless S1[5].nil?
  s1 += alpha[S1[6]] * s1_pow_6 unless S1[6].nil?
  s1 += alpha[S1[7]] * s1_pow_7 unless S1[7].nil?
  s1 += alpha[S1[8]] * s1_pow_8 unless S1[8].nil?
  s1 += alpha[S1[9]] * s1_pow_9 unless S1[9].nil?

  s2 = 0
  s2 += alpha[S2[0]] * s2_pow_0 unless S2[0].nil?
  s2 += alpha[S2[1]] * s2_pow_1 unless S2[1].nil?
  s2 += alpha[S2[2]] * s2_pow_2 unless S2[2].nil?
  s2 += alpha[S2[3]] * s2_pow_3 unless S2[3].nil?
  s2 += alpha[S2[4]] * s2_pow_4 unless S2[4].nil?
  s2 += alpha[S2[5]] * s2_pow_5 unless S2[5].nil?
  s2 += alpha[S2[6]] * s2_pow_6 unless S2[6].nil?
  s2 += alpha[S2[7]] * s2_pow_7 unless S2[7].nil?
  s2 += alpha[S2[8]] * s2_pow_8 unless S2[8].nil?
  s2 += alpha[S2[9]] * s2_pow_9 unless S2[9].nil?

  s3 = 0
  s3 += alpha[S3[0]] * s3_pow_0 unless S3[0].nil?
  s3 += alpha[S3[1]] * s3_pow_1 unless S3[1].nil?
  s3 += alpha[S3[2]] * s3_pow_2 unless S3[2].nil?
  s3 += alpha[S3[3]] * s3_pow_3 unless S3[3].nil?
  s3 += alpha[S3[4]] * s3_pow_4 unless S3[4].nil?
  s3 += alpha[S3[5]] * s3_pow_5 unless S3[5].nil?
  s3 += alpha[S3[6]] * s3_pow_6 unless S3[6].nil?
  s3 += alpha[S3[7]] * s3_pow_7 unless S3[7].nil?
  s3 += alpha[S3[8]] * s3_pow_8 unless S3[8].nil?
  s3 += alpha[S3[9]] * s3_pow_9 unless S3[9].nil?

  if s1 + s2 == s3
    puts(s1)
    puts(s2)
    puts(s3)
    exit
  end
end

puts("UNSOLVABLE")
