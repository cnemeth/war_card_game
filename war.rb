#!/usr/bin/env ruby

require File.expand_path(File.dirname(__FILE__) + '/player')
require File.expand_path(File.dirname(__FILE__) + '/deck')
require File.expand_path(File.dirname(__FILE__) + '/score_board')
require 'pry'
require 'awesome_print'

puts 'Let the game begin! ... Onwards and Upwards!'

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
      ap "+++[Beginning of loop] ..."

      if game_over?
        puts "Game Over! The winner is #{players.first.name}"
        break
      end

      if player = player_any_no_card_left
        ap "+++[Player #{player.name}] ... is being dropped"
        drop(player)
      end

      ap "+++[New draw, face up] ..."
      draw
      if war?
        puts 'War on!'
        ap "+++[New draw, face down] ..."
        draw
      else
        ap "+++[Players in system, in loop] ... #{players.map(&:id)}"
        player = round_winner
        ap "+++[Player #{player.name}] ... is the winner of the last round"
        ap "+++[Adding cards to #{player.name}] ... #{score_board.scores}"
        player.take_all(score_board.scores)
        puts "The round winner is #{player.name}, with card: #{winning_score}"
        @score_board = initialize_score_board
      end
    end
  end

  private

  def round_winner
    id = score_board.round_winner
    player = find_player_by(id)
    player
  end

  def winning_score
    score_board.winning_score
  end

  def war?
    score_board.war?
  end

  def game_over?
    players.count == 1 &&
      players.first.cards.count == total_cards_in_play
  end

  def player_any_no_card_left
    player = nil
    players.each do |p|
      player = p if p.cards.count == 0
    end

    player
  end

  def draw
    players.each do |player|
      card = player.draw
      ap "+++[#{player.name} drew card]: #{card.name}"
      score_board.add_score(player.id, card.rank)
    end
  end

  def drop(player)
    score_board.drop(player.id)
    players.delete(player)
    @num_players -= 1 unless @num_players == 0
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
    players.map{|p| player = p if p.id == id}

    player
  end

  def initialize_score_board
    @score_board = ScoreBoard.new(player_ids: players.map(&:id))
  end
end

ARGV.each do |v|
  num_players = (2..4).include?(v.to_i) ? v.to_i : 2
  game = War.new(num_players: num_players)
  game.play
end
