require File.expand_path(File.dirname(__FILE__) + '/player')

class War
  attr_reader :deck, :deck_count, :num_players, :players, :total_cards_in_play
  attr_accessor :winner, :round_winner, :current_score, :score_board

  def initialize(args)
    @num_players = args.fetch(:num_players)
    @players = setup_players
    @deck = shuffle_deck
    @deck_count = deck.count
    @total_cards_in_play = num_players*(deck_count/num_players)
    @current_score = initialize_current_score
    @score_board = initialize_score_board
    @round_winner = nil
    @winner = nil
  end

  def play
    deal_cards
    unless winner
      draw
      if war?(current_score)
        puts 'War on!'
        double_draw
      else
        player = round_winner
        puts "The round winner is #{player.object_id}"
        player.take_all(score_board.values.flatten)
        initialize_score_board
        initialize_current_score
      end
      winner = game_over?
    end
    puts "Game Over! The winner is #{winner}"
  end

  private

  def round_winner
    find_player_by(current_score.max.first)
  end

  def war?(current_score)
    case num_players
    when 2
      return current_score.values.uniq.count == 1
    when 3
      return current_score.values.uniq.count == 1 || current_score.values.uniq.count == 2
    when 4
      return current_score.values.uniq.count == 1 || current_score.values.uniq.count == 2 || current_score.values.uniq.count == 3
    else
      return false
    end
  end

  def game_over?
    players.each do |player|
      return player if player.cards.count == total_cards_in_play
    end

    false
  end

  def update_score
    score_board.merge(current_score){|key, first, second| first << second }
  end

  def draw
    players.each do |player|
      current_score[player.object_id] = player.draw
    end
    update_score
  end

  def double_draw
    draw
    draw
  end

  def setup_players
    p = []
    num_players.times{p << Player.new}

    p
  end

  def shuffle_deck
    deck_of_cards.flatten.shuffle!(random: srand)
  end

  def deal_cards
    num_cards_to_deal = deck_count/num_players
    (1..num_cards_to_deal).each do |i|
      players.each do |p|
        p.cards << deck.pop
      end
    end
  end

  def find_player_by(id)
    player = nil
    players.map{|p| player = p if p.object_id == id}

    player
  end

  def initialize_current_score
    h = {}
    players.map{|p| h[p.object_id] = []}

    h
  end

  def initialize_score_board
    h = {}
    players.map{|p| h[p.object_id] = []}

    h
  end

  def deck_of_cards
    [
      %w(A K Q J T 9 8 7 6 5 4 3 2),
      %w(A K Q J T 9 8 7 6 5 4 3 2),
      %w(A K Q J T 9 8 7 6 5 4 3 2),
      %w(A K Q J T 9 8 7 6 5 4 3 2)
    ]
  end
end
