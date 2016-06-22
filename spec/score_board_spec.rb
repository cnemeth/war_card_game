require 'spec_helper'

RSpec.describe ScoreBoard do
  let(:p1) { Player.new }
  let(:p2) { Player.new }
  let(:p3) { Player.new }
  let(:players) { [p1, p2, p3] }
  let(:player_ids) { players.map(&:id) }
  let(:player_scores) do
    h = {}
    3.times do
      player_ids.each.with_index do |pid, idx|
        h[pid] = [
          Faker::Number.between(2, 14),
          Faker::Number.between(2, 14),
          Faker::Number.between(2, 14)
        ]
      end
    end
    h
  end

  describe 'initialize' do
    it 'creates a scoreboard with players' do
      expect{
        ScoreBoard.new(player_ids: player_ids)
      }.to_not raise_error
    end
  end

  describe 'scores_for(player_id)' do
    it 'returns scores for a single player' do
      score_board = ScoreBoard.new({player_ids: player_ids})
      score_board.add_score(p1.id, 9)
      score_board.add_score(p1.id, 5)
      expect(score_board.scores_for(p1.id)).to match_array [9, 5]
    end
  end

  describe 'scores' do
    it 'returns scores for all players' do
      score_board = ScoreBoard.new({player_ids: player_ids})
      score_board.add(player_scores)
      expect(score_board.scores).to be_a_kind_of Array
      expect(score_board.scores).to_not be_empty
    end
  end

  describe 'adding score for single player' do
    it 'adds player score to board' do
      score_board = ScoreBoard.new({player_ids: player_ids})
      score_board.add_score(p1.id, 9)
      expect(score_board.board.values.flatten.first).to eq 9
    end
  end

  describe 'adding scores for multiple players' do
    it 'adds palyer scores to board' do
      score_board = ScoreBoard.new({player_ids: player_ids})
      scores = score_board.add(player_scores)
      expect(scores).to be_a_kind_of Hash
      expect(scores.values).to be_a_kind_of Array
      expect(scores.values.first.count).to eq 3
    end
  end

  describe 'clear' do
    it 'resets the score board to inital state' do
      score_board = ScoreBoard.new({player_ids: player_ids})
      scores = score_board.add(player_scores)
      expect(scores.values).to be_a_kind_of Array
      expect(scores.values.flatten).to_not be_empty

      scores = score_board.clear(player_ids)
      expect(scores.values.flatten).to be_empty
    end
  end

  describe 'drop_player' do
    it 'removes player with id' do
      scores = ScoreBoard.new({player_ids: player_ids})
      expect(scores.board.keys.count).to eq 3
      scores.drop(p1.id)
      expect(scores.board.keys.count).to eq 2
      expect(scores.board.keys).to_not include p1.object_id
    end
  end

  describe 'war?' do
    describe 'false' do
      it 'returns false if score board is empty' do
        h = {}
        h[p1.id] = []
        h[p2.id] = []
        h[p3.id] = []

        scores = ScoreBoard.new(player_ids: player_ids)
        scores.add(h)
        expect(scores.war?).to be false
      end

      it 'returns false if no matching scores in the last round' do
        h = {}
        h[p1.id] = [2, 14]
        h[p2.id] = [9, 8]
        h[p3.id] = [5, 11]

        scores = ScoreBoard.new({player_ids: player_ids})
        scores.add(h)
        expect(scores.war?).to be false
      end
    end

    describe 'true' do
      let(:player_scores) do
        h = {}
        h[p1.id] = [2, 9]
        h[p2.id] = [9, 8]
        h[p3.id] = [5, 9]
        h
      end

      it 'returns true if there are matching scores in the last round' do
        scores = ScoreBoard.new({player_ids: player_ids})
        scores.add(player_scores)
        expect(scores.war?).to be true
      end
    end
  end

  describe 'round_winner' do
    let(:player_scores) do
      h = {}
      h[p1.id] = [2, 9]
      h[p2.id] = [9, 14]
      h[p3.id] = [5, 10]
      h
    end

    it 'returns the player with the highest score from the last round' do
      scores = ScoreBoard.new({player_ids: player_ids})
      scores.add(player_scores)
      expect(scores.round_winner).to eq p2.id
    end
  end

  describe 'winning_score' do
    let(:player_scores) do
      h = {}
      h[p1.id] = [2, 9]
      h[p2.id] = [9, 14]
      h[p3.id] = [5, 10]
      h
    end

    it 'returns the player with the highest score from the last round' do
      scores = ScoreBoard.new({player_ids: player_ids})
      scores.add(player_scores)
      expect(scores.winning_score).to eq 14
    end
  end
end
