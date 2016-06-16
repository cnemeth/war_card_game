require 'spec_helper'

RSpec.describe War do
  describe 'play' do
    let(:num_players) {
      {
        num_players: 3
      }
    }

    it 'plays the game' do
      expect{
        War.new(num_players).play
      }.to_not raise_error
    end

    it 'accepts a number of players between 2 and 4 as input'
    it 'displays the outcome of each battle as output when the battle ends'
    it 'displays the outcome of each war as output when the war ends'
    it 'displays the winner of the game as output when the game ends'
  end
end
