
class Game
  def initialize(way,computer_way)
    @way = way
    @computer_way = computer_way
    
    case @computer_way
    when 0
      @computer_a = "上"
    when 1
      @computer_a = "下"
    when 2
      @computer_a = "右"
    when 3
      @computer_a = "左"
    end
    
    case @way
    when 0
      @player_a = "上"
    when 1
      @player_a = "下"
    when 2
      @player_a = "右"
    when 3
      @player_a = "左"
    else
      puts "異なる数字が入力されました"
      exit
    end
    
    puts "ホイ"
      
    puts "-------------------"
    puts "あなた：#{@player_a}を出しました"
    puts "相手　：#{@computer_a}を出しました"
    puts "-------------------"
  end
end


puts "じゃんけん"
puts "0(グー)1(チョキ)2(パー)3(戦わない)"
rps = 1
count = 0

while rps == 1

  player_rps = gets.to_i
  computer_rps = rand(0..2)
  
  case computer_rps
  when 0
    computer_j = "グー"
  when 1
    computer_j = "チョキ"
  when 2
    computer_j = "パー"
  end
  
  case player_rps
  when 0
    player_j = "グー"
  when 1
    player_j = "チョキ"
  when 2
    player_j = "パー"
  when 3
    puts "戦わない"
    break
  else
    puts "異なる数字が入力されました"
    break
  end
  
  if count == 0
    puts "ホイ"
  else
    puts "ショ"
  end
  
  puts "-------------------"
  puts "あなた：#{player_j}を出しました"
  puts "相手　：#{computer_j}を出しました"
  puts "-------------------"
  
  #じゃんけんの勝ち負けあいこの判定
  rps_pattern = ""
  if player_rps == computer_rps
    rps_pattern = "あいこ"
  elsif player_rps+1 == computer_rps || player_rps+2 == computer_rps
    rps_pattern = "あなたの勝ち"
  else
    rps_pattern = "相手の勝ち"
  end
  
  #じゃんけん結果によって、パターンを変える。
  case rps_pattern
  when "あいこ"
    count = 1
    rps = 1
    puts "あいこで．.．"
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"
  when "あなたの勝ち"
    count = 0
    puts "あっちむいて〜"
    puts "0(上)1(下)2(右)3(左)"
    way = gets.to_i
    computer_way = rand(0..3)
    game = Game.new(way,computer_way)
    
    if way == computer_way
      puts "あなたの勝ちです。おめでとう！"
      rps = 0
    else
      rps = 1
      puts "じゃんけん・・・"
      puts "0(グー)1(チョキ)2(パー)3(戦わない)"
    end
    
  when "相手の勝ち"
    count = 0
    puts "あっちむいて〜"
    puts "0(上)1(下)2(右)3(左)"
    way = gets.to_i
    computer_way = rand(0..3)
    game = Game.new(way,computer_way)
    
    if way == computer_way
      puts "相手の勝ちです。残念でした・・・"
      rps = 0
    else
      rps = 1
      puts "じゃんけん．.．"
      puts "0(グー)1(チョキ)2(パー)3(戦わない)"
    end
  end
end
