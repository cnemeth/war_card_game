require File.expand_path(File.dirname(__FILE__) + '/player')

class ScoreBoard
  attr_accessor :players, :board

  def initialize(args)
    @players = args.fetch(:players)
    @board = initialize_score_board
  end

  def add(scores)
    scores.each_pair do |k,val|
      if val.is_a?(Array) && val.size > 1
        val.each{|v| board[k] << v}
      else
        board[k] << val
      end
    end
  end

  def clear
    initialize_score_board
  end

  def remove_player(player_id)
    board.delete(player_id) if board.keys.include? player_id
  end

  def war?
    equal_scores_in_last_round?
  end

  def round_winner
    last_round_winner
  end

  private

  def last_round_winner
    id = nil
    board.each_pair{|k,v| id = k if v.last == winning_score}
    id
  end

  def winning_score
    board.values.map{|v| v.last}.max
  end

  def equal_scores_in_last_round?
    num_players = board.keys.count
    scores = board.values.map{|v| v.last}
    (1...num_players).include?(scores.uniq.count)
  end

  def initialize_score_board
    h = {}
    players.map{|p| h[p.object_id] = []}

    h
  end
end
