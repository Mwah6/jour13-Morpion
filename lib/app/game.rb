
$:.unshift File.expand_path("./../", __FILE__)

require 'pry'
require 'player'
require 'board'
require 'board_case'

class Game
  attr_accessor :current_player, :status
  def initialize
    # Statut de la partie
    @status = "on going"
    # Générateur de joueurs
    players_creator
    # Création du plateau
    @board = Board.new
    # Détermination aléatoire du premier à jouer
    @current_player = @players_array.sample
    # Lancement des tours
    turn
  end

  # Définition des tours
  def turn
    # Boucle "while" tant que le statut de la partie est le même
    while @status == "on going"
      # Appel de la méthode "play_turn" sur l'objet "board"
      @board.play_turn (@current_player)
      # Modification du statut selon la situation
      @status = @board.victory? (@current_player)
      # Fin du jeu si le statut change
      game_end (@status)
      # Changement de joueur (condition ternaire)
      @current_player == @players_array[0]?(@current_player = @players_array[1]) : (@current_player = @players_array[0])
    end
  end

  # Méthode qui crée les joueurs
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

  # Méthode qui mets fin au jeu si le statut change
  def game_end status
    case status
    when "Victoire !"
      puts "C'est gagné"
      puts "#{current_player.name}, vous êtes le meilleur !"
    when "Match nul !"
      puts "C'est un match nul !"
    end
  end
  binding.pry
end
