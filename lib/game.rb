
require_relative 'board'


class Game
  attr_accessor :symbol

  def initialize
    #presentation du jeu 
    system 'clear'
    # sleep 2 
    puts "Bienvenue au jeu du morpion version thp !".upcase.yellow
    puts""
    sleep 1
    puts "Le but du jeu est de remplir 3 cases a la suite dans la grille, BONNE CHANCE!!".red.underline
    sleep 1
    puts "----------Présentons les deux joueurs :----------".upcase
    # sleep 1
    puts "Joueur 1, ton symbole sera X, Entres ton GamerTag: ".yellow
    print ">"
    name_1 = gets.chomp
    puts " Bien le bonjour #{name_1}".upcase.underline.red
    # crée le joueur 1
    @player_1 = Player.new(name_1, "X")
    puts""
    sleep 1
    puts "Joueur 2, ton symbole sera o , Entres ton Gamertag: ".yellow
    sleep 1
    print ">"
    name_2 = gets.chomp
    puts " Bien le bonjour #{name_2}".upcase.underline.red
    # crée le joueur 2
    @player_2 = Player.new(name_2, "O")
    @current_player = @player_1
    sleep 1 
    puts""
    puts"Voici votre grille de jeu!".upcase.yellow# affichage du plateau de jeu
    @board = Board.new
  end

  def start
    while @board.victory? == false
      self.turn
    end
  end

  def switch_players
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def turn
    # On boucle tant qu'il n'y a pas de victoire
    loop do
    	system "clear"
    	puts "============="

    	puts "Voici l'état du jeu:".yellow
    	# Affiche le plateau :
      @board.board_display

      puts ""
      puts "C'est le tour de #{@current_player.name} avec les #{@current_player.symbol}"
      puts "Choisis une case"
      print ">"

      # On appelle la méthode play de la classe board sur le joueur en cours (current). Elle demande au joueur quelle case il joue, puis affiche son symbole dans la case
      @board.play_turn(@current_player.symbol)

      # On arrête la boucle en cas de victoire d'un joueur
      if @board.victory? == true
      	system "clear"
		   	puts "============="
		  	puts "Voici l'état du jeu:"
        @board.board_display
        puts ""
        puts "#{@current_player.name} a gagné la partie!!!".upcase.yellow
        puts
        break
      end
      switch_players
    end
  end 
end