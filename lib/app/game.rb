
$:.unshift File.expand_path("./../", __FILE__)

require 'pry'
require 'player'
require 'board'
require 'board_case'

class Game
  attr_accessor :current_player, :status
  def initialize
    @status = "on going"
    players_creator
    @board = Board.n
    @current_player = @players_array.sample
    turn

  end

def turn
  while @status == "on going"
@board.play_turn (@current_player)
@board.victory? (@current_player)
@current_player == @players_array[0]?(@current_player = @players_array[1]) : (@current_player = @players_array[0])
end



end
  def players_creator
    @players_array = Array.new
    puts "Veuillez saisir le nom du premier joueur :"
    print " >"
    name_1 = gets.chomp
    @players_array << player_1 = Player.new(name_1, 'X')
    puts "Bienvenue #{player_1.name} !"
    puts "Veuillez saisir le nom du second joueur :"
    print " >"
    name_2 = gets.chomp
    @players_array << player_2 = Player.new(name_2, 'O')
    puts "Bienvenue #{player_2.name} !"
  end

  def
    def on_going

    end



    binding.pry
  end
