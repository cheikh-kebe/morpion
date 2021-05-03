
class Board
  attr_accessor :board 

  def initialize
    @board =  [*0..8].map { |i|  BoardCase.new(i).case_number }
  end
  
  def board_display
    puts "#{@board[0..2].join(" | ")}"
    puts "--|---|--"
    puts "#{@board[3..5].join(" | ")}"
    puts "--|---|--"
    puts "#{@board[6..8].join(" | ")}"
  end
  #module qui va definir le tour de jeu 
  def play_turn(symbol)
    case_number = gets.chomp().to_i
    @board = @board.each_index.map { |e| e == case_number && @board[e] != "X" && @board[e] != "O" ? @board[e] = symbol : @board[e] }  
  end
  #module qui defini les conditions de victioire
  def victory?
    if (@board[0] == @board[1] && @board[0] == @board[2] || @board[3] == @board[4] && @board[3] == @board[5] || @board[6] == @board[7] && @board[6] == @board[8] || @board[0] == @board[3] && @board[0] == @board[6] || @board[1] == @board[4] && @board[1] == @board[7] || @board[2] == @board[5] && @board[2] == @board[8] || @board[0] == @board[4] && @board[0] == @board[8] || @board[2] == @board[4] && @board[2] == @board[6])
      return true
    else
      return false
    end
  end

end
