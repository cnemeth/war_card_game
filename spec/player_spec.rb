require 'spec_helper'

RSpec.describe Player do
  describe 'draw' do
    it 'returns the last card from deck' do
      player = Player.new
      player.cards = %w(A B C D)
      expect(player.draw).to eq 'D'
    end
  end

  describe 'take_all' do
    it 'add items to beginning of card stack' do
      player = Player.new
      player.cards = %w(C D)
      player.take_all(['A', 'B'])
      expect(player.cards).to eq %w(A B C D)
    end
  end
end
