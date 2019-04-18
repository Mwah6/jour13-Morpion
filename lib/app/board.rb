$:.unshift File.expand_path("./../", __FILE__)
require 'board_case'

class Board
  attr_accessor :board, :boardcases, :count_coup, :number_repeated


  def initialize
    @@number_possible = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @count_coup = 9
    @boardcases = []
    for i in (1..9)
      @boardcases << BoardCase.new(i)
    end
  end

  def coup_joue
    @count_coup = @@number_possible.length
    puts "Il te reste #{@count_coup} tours pour gagner !"
  end

  def play_turn (player)
    puts "C'est au tour de #{player.name} !"
    choice = ""
    loop do
      puts "Tu choisis quel case ?"
      choice = gets.chomp
      break if @@number_possible.include?(choice)
      puts "#{choice} n'est pas un choix possible ! Choisis autre chose"
    end
    puts choice
    puts @@number_possible
    puts choice
    @@number_possible.delete(choice)

    case choice
    when "1"
      @boardcases[0].value = player.value
    when "2"
      @boardcases[1].value = player.value
    when "3"
      @boardcases[2].value = player.value
    when "4"
      @boardcases[3].value = player.value
    when "5"
      @boardcases[4].value = player.value
    when "6"
      @boardcases[5].value = player.value
    when "7"
      @boardcases[6].value = player.value
    when "8"
      @boardcases[7].value = player.value
    when "9"
      @boardcases[8].value = player.value
    end
  end

  def  victory? (player)
    player_value_array = Array.new
    @boardcases.each {|x| player_value_array << x.position if x.value == player.value}
#       player_value_array << x.position if x.value == player.value
# end

    # player_value_array << @boardcases.each {|x| x.value == player.value}
    puts player_value_array
    victory_combinaison = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    victory_combinaison.each do |vict_comb|
      return @status = "Victory !" if player_value_array.include? vict_comb
      puts "#{vict_comb}, n'est pas bon"
    end
    @status = "Tie !" if @@number_possible.empty?
  end
end
