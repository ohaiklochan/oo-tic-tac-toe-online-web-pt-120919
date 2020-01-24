class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5], 
    [6,7,8], 
    [0,3,6], 
    [1,4,7], 
    [2,5,8], 
    [0,4,8], 
    [2,4,6]
  ]
  
  board = Array.new(9, " ")
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end 
  
  def move(position, user)
    @board[position] = user
  end
  
  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end
  
  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end
  
  def turn_count
    @board.count{|position| position == "X" || position == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? X : O
    
  
end