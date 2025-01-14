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
   
   def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
 if board[index] == " " || board[index] == "" || board[index] == nil
   return false
 else true
 end
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
    return true
  else false
 end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
if valid_move?(board, index)
  move(board, index, char = current_player(board))
  display_board(board)
else
  turn(board)
end
end

def turn_count(board)
  new_array = board.reject {|location| location == " "}
  new_array.length
end

def current_player(board)
  turn_count(board).even? ? "X":"O"
end

def won?(board)
  WIN_COMBINATIONS.find do |combo|
    position_taken?(board,combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
end
end

def full?(board)
  if board.include?(" ")
    return false
  else 
    return true
end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board) == nil
    return nil
  else
    board[won?(board)[0]]
end
end

def play(board)
  until over?(board)
 turn(board)
end
 if won?(board)
 puts "Congratulations #{winner(board)}!"
else if draw?(board)
  puts "Cat's Game!"
end
end
end