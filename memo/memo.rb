require 'csv'


def dump_csv(fname, lines, alt)
  alt == 1 ? mode = 'w' : mode = 'a'
  CSV.open(fname, mode) do |f|
    f << lines
  end
end

def get_filename
  puts '拡張子を除いたファイルを入力してください'
  gets.chomp! + '.csv'
end

def get_lines
  puts '"メモしたい内容を記入してください"'
  puts '完了したらCtrl + Dを押します'
  readlines.map &:chomp
end


# ------------ #
#     MAIN     #
# ------------ #
puts '1(新規でメモを作成) 2(既存のメモに追記)'
alt = gets.chomp!.to_i
if alt != 1 and alt !=2
  raise '1か2を入力してください'
end
filename = get_filename
lines = get_lines
dump_csv(filename, lines, alt)
