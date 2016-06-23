require 'spec_helper'

RSpec.describe Player do
  describe 'id' do
    it 'sets id to last 5 digits of object_id' do
      player = Player.new
      expect(player.id).to eq player.object_id.to_s[-5..-1]
      expect(player.id).to be_a_kind_of String
      expect(player.id.length).to eq 5
    end
  end

  describe 'name' do
    it 'sets id to object_id' do
      player = Player.new
      expect(player.name).to_not be_empty
    end
  end

  describe 'draw' do
    it 'returns the last card from deck' do
      card1 = Card.new(name: 'Q', rank: 12)
      card2 = Card.new(name: 'J', rank: 11)
      card3 = Card.new(name: 'A', rank: 14)
      player = Player.new
      player.cards = [card1, card2, card3]
      expect(player.draw).to eq card3
    end
  end

  describe 'take_all' do
    it 'add cards to beginning of the stack' do
      card1 = Card.new(name: 'K', rank: 13)
      card2 = Card.new(name: 'J', rank: 11)
      player = Player.new
      player.cards = [card1, card2]
      player.take_all(['14', '9'])
      expect(player.cards.map(&:name)).to eq %w(A 9 K J)
    end
  end
end
