# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # bottom row
  #------
  [0,3,6], # first column
  [1,4,7], # second column
  [2,5,8], # third column
  #------
  [0,4,8], # left diagonal
  [2,4,6] # right diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |element|
    pos1 = board[element[0]]
    pos2 = board[element[1]]
    pos3 = board[element[2]]
    if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
      return element
    end
  end
  return false
end

def full?(board)
  board.each do |element|
    if element == " " || element == ""
      return false
    end
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if won?(board)
    array = won?(board)
    return board[array[0]]
  end
end
