#!/usr/bin/env ruby
puts('AtCoderの問題URLを入力してください')
url = gets.chomp
m = url.match(%r{https://atcoder.jp/contests/.+/tasks/(.+)})
if m && m[1]
  path = "atcoder/trainings/#{m[1]}.rb"
  if !File.exist?(path)
    f = File.new(path, 'w')
    f.write("# frozen_string_literal: true\n")
    f.write("# #{url}\n")
    f.write("#\n")
    f.write("# ■考えたこと\n")
    f.write("#\n")
    f.write("# ■解説\n")
    f.write("#\n")
    f.close
    puts("#{path} created!")
  else
    puts("#{path} already exists!")
  end
end
