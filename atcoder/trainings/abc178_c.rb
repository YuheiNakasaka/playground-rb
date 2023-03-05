# https://atcoder.jp/contests/abc178/tasks/abc178_c
#
# ■考えたこと
# 長さNの正数列の中に0,9が含まれている正数列はいくつあるのか？という問題。多分桁DP。どうやって実装するんだっけ？
# 0&9が既に出てる場合、以降の数は0~9のなんでも良い
# 0&9がまだ出てない場合、以降の数は0,9の出てない方がないとだめ
#
# ■解説
# DPじゃなかった。包除原理(集合論理のあれ)を使うらしい。
# A=0なるiが存在しないようなAは9**N通りある。
# A=9なるiが存在しないようなAは9**N通りある。
# A=0なるiとA=9なるiが共に存在しないようなAは8**N通りある。
# A=0なるiとA=9なるiの少なくとも一方が存在しないような9**N + 9**N - 8**N通りある
# Aは10**N通りある
# A=0なるiとA=9なるiが共に存在するようなAは10**N-(9**N + 9**N - 8**N)通りある
# https://atcoder.jp/contests/abc178/editorial/104

N = gets.to_i
puts((10 ** N - 2 * 9 ** N + 8 ** N) % (10 ** 9 + 7))
