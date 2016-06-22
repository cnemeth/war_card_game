require 'spec_helper'

RSpec.describe ScoreBoard do
  describe 'initialize' do
    let(:p1) { Player.new }
    let(:p2) { Player.new }
    let(:p3) { Player.new }
    let(:players) { [p1, p2, p3] }

    it 'creates a scoreboard with players' do
      expect{
        ScoreBoard.new({players: players})
      }.to_not raise_error
    end
  end

  describe 'add_scores' do
    let(:p1) { Player.new }
    let(:p2) { Player.new }
    let(:p3) { Player.new }
    let(:players) { [p1, p2, p3] }

    let(:player_scores) do
      h = {}
      3.times do
        players.each.with_index do |p, idx|
          h[p.object_id] = [
            Faker::Number.between(2, 14),
            Faker::Number.between(2, 14),
            Faker::Number.between(2, 14)
          ]
        end
      end
      h
    end

    it 'add palyer scores to board' do
      score_board = ScoreBoard.new({players: players})
      scores = score_board.add(player_scores)
      expect(scores).to be_a_kind_of Hash
      expect(scores.values.map{|v| v.any?}.uniq.first).to be true
      expect(scores.values.map{|v| v.count}.uniq.first).to eq 3
    end
  end

  describe 'clear_board' do
    let(:p1) { Player.new }
    let(:p2) { Player.new }
    let(:p3) { Player.new }
    let(:players) { [p1, p2, p3] }

    let(:player_scores) do
      h = {}
      players.each.with_index do |p, idx|
        h[p.object_id] = [
          Faker::Number.between(2, 14),
          Faker::Number.between(2, 14),
          Faker::Number.between(2, 14)
        ]
      end
      h
    end

    it 'resets the score board to inital state' do
      score_board = ScoreBoard.new({players: players})
      scores = score_board.add(player_scores)
      expect(scores.values.map{|v| v.any?}.uniq.first).to be true

      scores = score_board.clear
      expect(scores.values.map{|v| v.empty?}.uniq.first).to be true
    end
  end

  describe 'remove_player' do
    let(:p1) { Player.new }
    let(:p2) { Player.new }
    let(:p3) { Player.new }
    let(:players) { [p1, p2, p3] }

    it 'removes player with id' do
      scores = ScoreBoard.new({players: players})
      expect(scores.board.keys.count).to eq 3
      scores.remove_player(p1.object_id)
      expect(scores.board.keys.count).to eq 2
      expect(scores.board.keys).to_not include p1.object_id
    end
  end

  describe 'war?' do
    describe 'false' do
      let(:p1) { Player.new }
      let(:p2) { Player.new }
      let(:p3) { Player.new }
      let(:players) { [p1, p2, p3] }

      let(:player_scores) do
        h = {}
        h[p1.object_id] = [2, 14]
        h[p2.object_id] = [9, 8]
        h[p3.object_id] = [5, 11]
        h
      end

      it 'returns false if no matching scores in the last round' do
        scores = ScoreBoard.new({players: players})
        scores.add(player_scores)
        expect(scores.war?).to be false
      end
    end

    describe 'true' do
      let(:p1) { Player.new }
      let(:p2) { Player.new }
      let(:p3) { Player.new }
      let(:players) { [p1, p2, p3] }

      let(:player_scores) do
        h = {}
        h[p1.object_id] = [2, 9]
        h[p2.object_id] = [9, 8]
        h[p3.object_id] = [5, 9]
        h
      end

      it 'returns false if no matching scores in the last round' do
        scores = ScoreBoard.new({players: players})
        scores.add(player_scores)
        expect(scores.war?).to be true
      end
    end
  end

  describe 'round_winner' do
    let(:p1) { Player.new }
    let(:p2) { Player.new }
    let(:p3) { Player.new }
    let(:players) { [p1, p2, p3] }

    let(:player_scores) do
      h = {}
      h[p1.object_id] = [2, 9]
      h[p2.object_id] = [9, 14]
      h[p3.object_id] = [5, 10]
      h
    end

    it 'returns the player with the highest score from the last round' do
      scores = ScoreBoard.new({players: players})
      scores.add(player_scores)
      expect(scores.round_winner).to eq p2.object_id
    end
  end
end
