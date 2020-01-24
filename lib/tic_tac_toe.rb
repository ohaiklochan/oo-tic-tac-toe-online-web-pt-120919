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
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9"
    user_input = gets.chomp
    position = input_to_index(user_input)
    user = current_player
    if valid_move?(position)
      move(position, user)
      display_board
    else
      turn
    end
  end
  
  def won?
      WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
    return false
  end
  
  def full?
    @board.all? {|position| position == "X" || position == "O"}
  end
  
  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end
  
  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end
  
  def winner
    position = []
    position = won?
    if position == false
      return nil
    else
      if @board[position[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
  
  def play
    
      
end