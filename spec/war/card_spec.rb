require 'spec_helper'

RSpec.describe CsnWar::Card do
  let(:ace)   { CsnWar::Card.new(name: 'A', rank: 14) }
  let(:king)  { CsnWar::Card.new(name: 'K', rank: 13) }
  let(:queen) { CsnWar::Card.new(name: 'Q', rank: 12) }
  let(:jack)  { CsnWar::Card.new(name: 'J', rank: 11) }
  let(:ten)   { CsnWar::Card.new(name: 'T', rank: 10) }
  let(:nine)  { CsnWar::Card.new(name: '9', rank: 9) }
  let(:eight) { CsnWar::Card.new(name: '8', rank: 8) }
  let(:seven) { CsnWar::Card.new(name: '7', rank: 7) }
  let(:six)   { CsnWar::Card.new(name: '6', rank: 6) }
  let(:five)  { CsnWar::Card.new(name: '5', rank: 5) }
  let(:four)  { CsnWar::Card.new(name: '4', rank: 4) }
  let(:three) { CsnWar::Card.new(name: '3', rank: 3) }
  let(:two)   { CsnWar::Card.new(name: '2', rank: 2) }

  describe 'initialize' do
    let(:cards) { [ace, king, queen, jack, ten, nine, eight, seven, six, five, four, three, two] }

    it 'only allows valid name, rank combination ' do
      cards.each do |card|
        expect{
          CsnWar::Card.new({name: card.name, rank: card.rank})
        }.to_not raise_error
      end
    end

    it 'does not allow invalid name, rank combinations' do
      [{'A': 1}, {'Foo': 9}, {'Bar': 99}].each do |args|
        expect{
          CsnWar::Card.new({name: args.keys.first, rank: args.values.first})
        }.to raise_error(ArgumentError, 'Invalid args')
      end
    end
  end

  describe '#make' do
    it 'makes card object based on rank' do
      (2..14).each do |rank|
        expect{
          CsnWar::Card.make(rank)
        }.to_not raise_error
      end
    end
  end

  describe '#name_for_rank' do
    it 'returns the card name corresponding to the rank' do
      expect(CsnWar::Card.name_for_rank(14)).to eq 'A'
    end
  end

  describe '#min' do
    let(:cards) { [ace, king, ten, two] }

    it 'returns the smallest ranked card in the bunch' do
      expect(CsnWar::Card.min(cards)).to eq two
    end
  end

  describe '#max' do
    let(:cards) { [ace, king, ten, two] }

    it 'returns the highest ranked card in the bunch' do
      expect(CsnWar::Card.max(cards)).to eq ace
    end
  end

  describe '#equal?' do
    let(:cards) { [nine, nine] }

    it 'returns ture if two cards are ranked equal' do
      expect(CsnWar::Card.equal?(nine, nine)).to eq true
    end
  end

  describe '#sort_by_rank_ascending' do
    let(:cards) { [ace, king, queen, jack, ten, nine, eight, seven, six, five, four, three, two] }

    it 'returns the cards in ascending rank order (lowest rank first)' do
      result = CsnWar::Card.sort_by_rank_ascending(cards)
      expect(result.first).to eq two
      expect(result.last).to eq ace
    end
  end

  describe '#sort_by_rank_descending' do
    let(:cards) { [ace, king, queen, jack, ten, nine, eight, seven, six, five, four, three, two] }

    it 'returns the cards in ascending rank order (lowest rank first)' do
      result = CsnWar::Card.sort_by_rank_descending(cards)
      expect(result.first).to eq ace
      expect(result.last).to eq two
    end
  end
end
