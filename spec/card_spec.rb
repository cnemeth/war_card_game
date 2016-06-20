require 'spec_helper'

RSpec.describe Card do
  let(:ace)   { Card.new(name: 'A', rank: 14) }
  let(:king)  { Card.new(name: 'K', rank: 13) }
  let(:queen) { Card.new(name: 'Q', rank: 12) }
  let(:jack)  { Card.new(name: 'J', rank: 11) }
  let(:ten)   { Card.new(name: 'T', rank: 10) }
  let(:nine)  { Card.new(name: '9', rank: 9) }
  let(:eight) { Card.new(name: '8', rank: 8) }
  let(:seven) { Card.new(name: '7', rank: 7) }
  let(:six)   { Card.new(name: '6', rank: 6) }
  let(:five)  { Card.new(name: '5', rank: 5) }
  let(:four)  { Card.new(name: '4', rank: 4) }
  let(:three) { Card.new(name: '3', rank: 3) }
  let(:two)   { Card.new(name: '2', rank: 2) }

  describe 'initialize' do
    let(:cards) { [ace, king, queen, jack, ten, nine, eight, seven, six, five, four, three, two] }

    it 'only allows valid name, rank combination ' do
      cards.each do |card|
        expect{
          Card.new({name: card.name, rank: card.rank})
        }.to_not raise_error
      end
    end

    it 'does not allow invalid name, rank combinations' do
      [{'A': 1}, {'Foo': 9}, {'Bar': 99}].each do |args|
        expect{
          Card.new({name: args.keys.first, rank: args.values.first})
        }.to raise_error(ArgumentError, 'Invalid args')
      end
    end
  end

  describe '#min' do
    let(:cards) { [ace, king, ten, two] }

    it 'returns the smallest ranked card in the bunch' do
      expect(Card.min(cards)).to eq two
    end
  end

  describe '#max' do
    let(:cards) { [ace, king, ten, two] }

    it 'returns the highest ranked card in the bunch' do
      expect(Card.max(cards)).to eq ace
    end
  end

  describe '#equal?' do
    let(:cards) { [nine, nine] }

    it 'returns ture if two cards are ranked equal' do
      expect(Card.equal?(nine, nine)).to eq true
    end
  end

  describe '#sort_by_rank_ascending' do
    let(:cards) { [ace, king, queen, jack, ten, nine, eight, seven, six, five, four, three, two] }

    it 'returns the cards in ascending rank order (lowest rank first)' do
      result = Card.sort_by_rank_ascending(cards)
      expect(result.first).to eq two
      expect(result.last).to eq ace
    end
  end

  describe '#sort_by_rank_descending' do
    let(:cards) { [ace, king, queen, jack, ten, nine, eight, seven, six, five, four, three, two] }

    it 'returns the cards in ascending rank order (lowest rank first)' do
      result = Card.sort_by_rank_descending(cards)
      expect(result.first).to eq ace
      expect(result.last).to eq two
    end
  end
end
