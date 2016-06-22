class ScoreBoard
  attr_accessor :board

  def initialize(args)
    @board = initialize_score_board(args.fetch(:player_ids))
  end

  def add_score(player_id, score)
    board[player_id] << score
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

  def scores_for(player_id)
    board[player_id]
  end

  def scores
    board.values.flatten
  end

  def clear(player_ids)
    @board = initialize_score_board(player_ids)
  end

  def drop(player_id)
    drop_player(player_id)
  end

  def war?
    equal_scores_in_last_round?
  end

  def round_winner
    last_round_winner
  end

  def winning_score
    last_round_winning_score
  end

  private

  def drop_player(player_id)
    board.delete(player_id) if board.keys.include? player_id
  end

  def last_round_winner
    id = nil
    board.each_pair{|k,v| id = k if v.last == winning_score}
    id
  end

  def last_round_winning_score
    board.values.map{|v| v.last}.max
  end

  def equal_scores_in_last_round?
    return false if board.values.flatten.empty?

    num_players = board.keys.count
    scores = board.values.map{|v| v.last}
    (1...num_players).include?(scores.uniq.count)
  end

  def initialize_score_board(player_ids=[])
    return unless player_ids.any?

    h = {}
    player_ids.map{|pid| h[pid] = []}

    h
  end
end
