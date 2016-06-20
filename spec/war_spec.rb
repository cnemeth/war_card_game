require 'spec_helper'

RSpec.describe War do
  describe 'play' do
    it 'plays the game with a number of players between 2 and 4 as input' do
      (2..4).each do |i|
        expect{
          War.new({num_players: i})
        }.to_not raise_error
      end
    end
  end
end
