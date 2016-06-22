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
