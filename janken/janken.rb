require 'date'


def cyclicise(you, opponent)
  raise 'Error' if you > 0 and opponent > 0
  if you == -1 and opponent == -3
    opponent = 0
  elsif you == -3 and opponent == -1
    opponent = -4
  end
  return you, opponent
end

def get_direction(who)
  case who
  when 1 then
    '上'
  when 2 then
    '下'
  when 3 then
    '左'
  when 4 then
    '右'
  end
end

def get_hand(who)
  case who
  when 1 then
    'グー'
  when 2 then
    'チョキ'
  when 3 then
    'パー'
  else
    raise '反則です'
  end
end

def judge_janken(you, opponent)
  you, opponent = sign(you, opponent)
  you, oppenent = cyclicise(you, opponent)
  if you > oppenent
    1
  elsif you < oppenent
    -1
  else
    0
  end
end

def sign(you, opponent)
  return -you, -opponent
end


# ------------------------ # 
#           MAIN           #
# ------------------------ # 
seed = Time.now.to_i
srand(seed)

result_janken = 9999
while
  result_janken != 0 ? line = 'じゃんけん...' : line = 'あいこで...'
  puts line
  puts '1（グー）2（チョキ）3（パー）4（やめる）'
  you = gets.chomp!.to_i
  exit if you == 4
  raise '反則です' if you == 0 or you > 4

  your_hand = get_hand(you)
  opponent = rand(1..3)
  opponent_hand = get_hand(opponent)

  result_janken != 0 ? line = 'ホイ！' : line = 'しょっ！'
  puts line
  puts '-----------------'
  puts 'あなた：' + your_hand + 'を出しました'
  puts '相手  ：' + opponent_hand + 'を出しました'
  puts '-----------------'
  result_janken = judge_janken(you, opponent)

  if result_janken != 0
    puts 'あっち向いて...'
    puts '1（上）2（下）3（左）4（右）'
    you = gets.chomp!.to_i
    your_direction = get_direction(you)
    opponent = rand(1..4)
    opponent_direction = get_direction(opponent)
    puts 'ホイ！'
    puts '---------------'
    puts 'あなた：' + your_direction
    puts '相手  ：' + opponent_direction
    puts '---------------'
    raise '反則です' if you == 0 or you > 4
    if you == opponent
      if result_janken == 1
	puts 'あなたの勝ちです！'
	break
      elsif result_janken == -1
        puts 'あなたの負けです。。。'
	break
      else
        raise 'Error!'
      end
    end
  end
end
