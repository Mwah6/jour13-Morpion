$:.unshift File.expand_path("./../", __FILE__)
require 'board_case'

class Board
  attr_accessor :board, :boardcases, :count_coup


  def initialize
    # Liste des coups possibles
    @number_possible = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    # Génération des 9 cases du morpion
    @boardcases = []
    for i in (1..9)
      @boardcases << BoardCase.new(i)
    end
  end

  # Décompte des tours restant
  def coup_joue
    puts "Il reste #{@number_possible.length} tours pour gagner !"
  end

  def play_turn (player)
    puts "C'est au tour de #{player.name} !"
    # initialisation de la variable choice
    choice = ""
    # Boucle de choix. "Breack" la boucle si le choix est possible
    loop do
      puts "Tu choisis quel case ?"
      choice = gets.chomp
      break if @number_possible.include?(choice)
      puts "#{choice} n'est pas un choix possible ! Choisis autre chose"
    end

    # Suppression du choix de la liste des coups possibles
    @number_possible.delete(choice)

    # "Case" qui va affecter le choix sur la valeur d'une case
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

  # Test si le total des coups joués permettent au joueur de l'emporter
  def  victory? (player)

    # Combinaisons à avoir pour gagner
    victory_combination = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

    # Récupération des coups joués par le joueur actuel
    player_value_array = Array.new
    @boardcases.each {|x| player_value_array << x.position if x.value == player.value}
    # puts "le joueur actuel a joué au total : #{player_value_array}"

    # Test si les coups joués correspondent à une combinaison
    victory_combination.each do |vict_comb|
      return "Victoire !" if (vict_comb-player_value_array).empty?
      # puts "#{vict_comb}, n'est pas bon"
    end

    # Test si tous coups posssibles ont été joués
    return "Match nul !" if  @number_possible.empty?
    # renvoie "on going" par défaut
    return "on going"
  end
end
