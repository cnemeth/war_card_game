require File.expand_path(File.dirname(__FILE__) + '/player')
require File.expand_path(File.dirname(__FILE__) + '/deck')

class War
  attr_reader :deck_count, :players, :total_cards_in_play
  attr_accessor :num_players, :deck, :round_winner, :score_board

  def initialize(args)
    @num_players = args.fetch(:num_players, 2)
    @players = setup_players
    @deck = Deck.new
    @deck_count = deck.cards.count
    @total_cards_in_play = num_players*(deck_count/num_players)
    @score_board = initialize_score_board
    @round_winner = nil
  end

  def play
    shuffle_deck
    deal_cards
    loop do
      winner = game_over?
      if winner
        puts "Game Over! The winner is #{players.first.name}"
        break
      else
        draw
        if war?
          puts 'War on!'
          draw
        else
          player = round_winner
          player.take_all(score_board.values.flatten)
          puts "The round winner is #{player.name}, with score: #{winning_score}"
          @score_board = initialize_score_board
        end
      end
    end
  end

  private

  def round_winner
    id = nil
    score_board.each_pair{|k,v| id = k if v.last.rank == winning_score}
    find_player_by(id)
  end

  def winning_score
    score_board.values.map{|v| v.last.rank}.max
  end

  def war?
    scores = score_board.values.map{|v| v.last.rank if v.last.rank}

    case scores.count
    when 2
      return scores.uniq.count == 1
    when 3
      return scores.uniq.count == 1 || scores.uniq.count == 2
    when 4
      return scores.uniq.count == 1 || scores.uniq.count == 2 || scores.uniq.count == 3
    else
      return false
    end
  end

  def game_over?
    players.count == 1
  end

  def draw
    players.each do |player|
      if player.cards.any?
        score_board[player.object_id] << player.draw
      else
        drop(player)
      end
    end
  end

  def drop(player)
    id = player.object_id
    players.delete(player)
    score_board.delete(id)
    @num_players -= 1
  end

  def setup_players
    p = []
    num_players.times{p << Player.new}

    p
  end

  def shuffle_deck
    deck.shuffle
  end

  def deal_cards
    num_cards_to_deal = deck_count/num_players
    (1..num_cards_to_deal).each do |i|
      players.each do |p|
        p.cards << deck.cards.pop
      end
    end
  end

  def find_player_by(id)
    player = nil
    players.map{|p| player = p if p.object_id == id}

    player
  end

  def initialize_score_board
    h = {}
    players.map{|p| h[p.object_id] = []}

    h
  end
end
