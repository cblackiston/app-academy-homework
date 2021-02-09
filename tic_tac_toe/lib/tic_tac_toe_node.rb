require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board, @next_mover_mark, @prev_move_pos = board, next_mover_mark, prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_arr = []    

    (0...board.rows.length).each do |row|
      (0...board.rows.length).each do |col|
        pos = row, col
        if board.empty?(pos)
          new_board = board.dup
          new_board[pos] = next_mover_mark
          next_mover_mark = (self.next_mover_mark == :x ? :o : :x)
          children_arr << self.class.new(new_board, next_mover_mark, pos)
        end
      end
    end
    children_arr
  end

  def losing_node?(mark)
    if board.over?
      return board.won? && board.winner != mark
    end

    child_nodes = self.children

    if next_mover_mark == mark 
      child_nodes.all? { |child_node| child_node.losing_node?(mark) }
    else
      child_nodes.any? { |child_node| child_node.losing_node?(mark) }
    end
  end

  def winning_node?(mark)
    if board.over?
      return board.winner == mark
    end

    child_nodes = self.children
    
    if next_mover_mark == mark
      child_nodes.any? { |child_node| child_node.winning_node?(mark) }
    else
      child_nodes.all? { |child_node| child_node.winning_node?(mark) }
    end
  end

end

