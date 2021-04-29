
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
      @current_player = @player_2
    end
  end

  def turn 
    loop do
      system 'clear'
      puts "=============".red
      puts "Voici l'état du jeu:" # Affiche le plateau vierge:
      @board.board_display
      puts "=============".red
      
      puts ""
      puts "C'est au tour de #{@current_player.name} qui joue les #{@current_player.symbol}".yellow
      puts "Choisis ta case Narvaloooo"
      print ">"

    # On appelle la méthode play_turn de la classe Board sur le joueur en cours (current). 
    #Elle demande au joueur quelle case il joue, puis affiche son symbole dans la case
      @board.play_turn(@current_player.symbol)

    # On arrête la boucle en cas de victoire
      if @board.victory? == true
        system "clear"
        puts "=============".red
        puts "Voici l'état du jeu:"
        @board.board_display
        puts ""
        puts "#{@current_player.name} est le Mopionator !!!".yellow.upcase
        puts
        break
      end
    end
    switch_players
  end
end