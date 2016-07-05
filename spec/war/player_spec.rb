require 'spec_helper'

RSpec.describe CsnWar::Player do
  subject { CsnWar::Player.new }

  describe 'id' do
    it 'sets id to last 5 digits of object_id' do
      expect(subject.id).to eq subject.object_id.to_s[-5..-1]
      expect(subject.id).to be_a_kind_of String
      expect(subject.id.length).to eq 5
    end
  end

  describe 'name' do
    it 'sets id to object_id' do
      expect(subject.name).to_not be_empty
    end
  end

  describe 'draw' do
    it 'returns the last card from deck' do
      card1 = CsnWar::Card.new(name: 'Q', rank: 12)
      card2 = CsnWar::Card.new(name: 'J', rank: 11)
      card3 = CsnWar::Card.new(name: 'A', rank: 14)
      subject.cards = [card1, card2, card3]
      expect(subject.draw).to eq card3
    end
  end

  describe 'take_all' do
    it 'add cards to beginning of the stack' do
      card1 = CsnWar::Card.new(name: 'K', rank: 13)
      card2 = CsnWar::Card.new(name: 'J', rank: 11)
      subject.cards = [card1, card2]
      subject.take_all(['14', '9'])
      expect(subject.cards.map(&:name)).to eq %w(A 9 K J)
    end
  end
end
