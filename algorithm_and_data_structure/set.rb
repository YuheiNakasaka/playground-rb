# Rubyのset(集合型)は標準ライブラリなのでrequire 'set'して使う。
# 要素は重複しないことが保証されている
# 要素間の順序は保持されない。ただしaddした順序は保持される。理由としては内部的にはHashだから。
# データの追加・削除・検索の処理速度が O(log N)
#
# library set - Ruby3.2リファレンスマニュアル
# https://docs.ruby-lang.org/ja/latest/library/set.html

require "set"

set = Set.new
set.add(10)
set.add(7)
set.add(3)
set.add(5)
set.add(1)

p(set)
# #<Set: {10, 7, 3, 5, 1}>

set.delete(5)

p(set)
# #<Set: {10, 7, 3, 1}>
