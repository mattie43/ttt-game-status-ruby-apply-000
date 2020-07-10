# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # Horizontal
  [0,1,2],
  [3,4,5],
  [6,7,8],
  # Vertical
  [0,3,6],
  [1,4,7],
  [2,5,8],
  # Diagonal
  [0,4,8],
  [2,4,6] ]
  
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1] 
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      win_check = "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      win_check = "O"
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.each { |let| return false if let == " " }
  return true
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  return false
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
  return false
end

def winner(board)
  if over?(board)
    game_won = won?(board)
    print game_won
    if game_won[0] == "X"
      return "X"
    elsif game_won[0] == "O"
      return "O"
    end
  end
  nil
end