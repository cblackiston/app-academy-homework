require_relative 'tic_tac_toe_node'
require "byebug"

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)

    node.children.each do |node|
      return node.prev_move_pos if node.winning_node?(mark)
    end
    node.children.each do |node|
      return node.prev_move_pos if !node.losing_node?(mark)
    end
    raise
  end
end




if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
