# !/usr/bin/env ruby

puts('鉄則の番号(a19やb31のような)を入力してください')

no = gets.chomp

if no =~ /(a|b)(\d+)/
  path = "atcoder/trainings/tessoku/#{no}.rb"
  if !File.exist?(path)
    f = File.new(path, 'w')
    f.write("# \n")
    f.write("#\n")
    f.write("class Solver\n")
    f.write("  def initialize\n")
    f.write("  end\n")
    f.write("\n")
    f.write("  def solve\n")
    f.write("  end\n")
    f.write("end\n")
    f.write("\n")
    f.write("Solver.new.solve\n")
    f.close
    puts("#{path} created!")
  else
    puts("#{path} already exists!")
  end
end
