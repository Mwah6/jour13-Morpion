
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
      # Relance d'une partie
      restart (@status)
      # Changement de joueur (condition ternaire)
      @current_player == @players_array[0]?(@current_player = @players_array[1]) : (@current_player = @players_array[0])
    end
  end

  # Méthode qui crée les joueurs
  def players_creator

    puts "Bienvenue dans cette nouvelle partie de morpion !"
    puts ""
    @players_array = Array.new
    puts "👋 👋 👋 Veuillez saisir le nom du premier joueur 👋 👋 👋 "
    print " > "
    name_1 = gets.chomp
    @players_array << player_1 = Player.new(name_1, '❌')
    puts "Bienvenue #{player_1.name} !".colorize(:color => :light_blue)
    puts "🙇 🙇 🙇 Veuillez saisir le nom du second joueur 🙇‍♀️ 🙇‍♀️ 🙇‍♀️ :"
    print " > "
    name_2 = gets.chomp
    @players_array << player_2 = Player.new(name_2, '⭕')
    puts "Bienvenue #{player_2.name} !".colorize(:color => :light_blue)
  end

  # Méthode qui mets fin au jeu si le statut change
  def game_end status
    case status
    when "Victoire !"
      puts "🎉 🎉 👏 👏 👏 C'est gagné 👏 👏 👏 🎉 🎉"
      puts "You 're on 🔥 🔥 🔥 🔥 🔥"
      puts "#{current_player.name}, vous êtes le meilleur 🥳 🥳 🥳 🥳 !"
      puts "#{current_player.name},  /$$      /$$ /$$$$$$ /$$   /$$
      | $$  /$ | $$|_  $$_/| $$$ | $$
      | $$ /$$$| $$  | $$  | $$$$| $$
      | $$/$$ $$ $$  | $$  | $$ $$ $$
      | $$$$_  $$$$  | $$  | $$  $$$$
      | $$$/ \  $$$  | $$  | $$\  $$$
      | $$/   \  $$ /$$$$$$| $$ \  $$
      |__/     \__/|______/|__/  \__/



      /$$      /$$ /$$$$$$ /$$   /$$
      | $$  /$ | $$|_  $$_/| $$$ | $$
      | $$ /$$$| $$  | $$  | $$$$| $$
      | $$/$$ $$ $$  | $$  | $$ $$ $$
      | $$$$_  $$$$  | $$  | $$  $$$$
      | $$$/ \  $$$  | $$  | $$\  $$$
      | $$/   \  $$ /$$$$$$| $$ \  $$
      |__/     \__/|______/|__/  \__/



      /$$      /$$ /$$$$$$ /$$   /$$
      | $$  /$ | $$|_  $$_/| $$$ | $$
      | $$ /$$$| $$  | $$  | $$$$| $$
      | $$/$$ $$ $$  | $$  | $$ $$ $$
      | $$$$_  $$$$  | $$  | $$  $$$$
      | $$$/ \  $$$  | $$  | $$\  $$$
      | $$/   \  $$ /$$$$$$| $$ \  $$
      |__/     \__/|______/|__/  \__/





      /$$      /$$ /$$$$$$ /$$   /$$
      | $$  /$ | $$|_  $$_/| $$$ | $$
      | $$ /$$$| $$  | $$  | $$$$| $$
      | $$/$$ $$ $$  | $$  | $$ $$ $$
      | $$$$_  $$$$  | $$  | $$  $$$$
      | $$$/ \  $$$  | $$  | $$\  $$$
      | $$/   \  $$ /$$$$$$| $$ \  $$
      |__/     \__/|______/|__/  \__/  ".colorize(:color => :blue)




    when "Match nul !"
      puts "$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$
      |______/|______/|______/|______/|______/|______/|______/






      /$$      /$$  /$$$$$$  /$$$$$$$$ /$$$$$$  /$$   /$$
      | $$$    /$$$ /$$__  $$|__  $$__//$$__  $$| $$  | $$
      | $$$$  /$$$$| $$  \ $$   | $$  | $$  \__/| $$  | $$
      | $$ $$/$$ $$| $$$$$$$$   | $$  | $$      | $$$$$$$$
      | $$  $$$| $$| $$__  $$   | $$  | $$      | $$__  $$
      | $$\  $ | $$| $$  | $$   | $$  | $$    $$| $$  | $$
      | $$ \/  | $$| $$  | $$   | $$  |  $$$$$$/| $$  | $$
      |__/     |__/|__/  |__/   |__/   \______/ |__/  |__/



      /$$   /$$ /$$   /$$ /$$
      | $$$ | $$| $$  | $$| $$
      | $$$$| $$| $$  | $$| $$
      | $$ $$ $$| $$  | $$| $$
      | $$  $$$$| $$  | $$| $$
      | $$\  $$$| $$  | $$| $$
      | $$ \  $$|  $$$$$$/| $$$$$$$$
      |__/  \__/ \______/ |________/






      /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$
      |______/|______/|______/|______/|______/|______/|______/
      "
    end
  end
  # Fonction restart à la fin de la partie
  def restart status
    # Se lance si le status change
    if status != "on going"
      puts "Voulez-vous rejouer ?"
      puts "Oui             Non"
      # Initialisation de la variable
      choice = ""
      # Boucle qui ne s'arrête que lorsque la réponse est oui ou non
      loop do
        choice = gets.chomp
        break if choice.downcase == "oui" || choice.downcase == "non"
        puts "#{choice} n'est pas un choix possible ! Choisissez entre \"oui\" et \"non\""
      end
      # Si oui, nettoyage de l'écran et nouvelle partie
      if choice == "oui"
        system "clear"
        (Game.new)
        # Si autre chose, Ciao !
      else
        (puts "A la prochaine ! ;)")
      end
    end
  end
end
