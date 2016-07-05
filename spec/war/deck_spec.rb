require 'spec_helper'

RSpec.describe CsnWar::Deck do
  subject { CsnWar::Deck.new }

  describe 'initialize' do
    it 'has 52 cards in a deck' do
      expect(subject.cards.count).to eq 52
    end

    it 'has 4 of each kind of card' do
      result = subject.cards.map(&:name)
      expect(result.first(4).uniq).to eq ['A']
      expect(result.last(4).uniq).to eq ['2']
    end
  end

  describe '#shuffle' do
    it 'shuffles the deck' do
      original_deck = subject
      shuffled_deck = subject.shuffle
      expect(original_deck).to_not eq shuffled_deck
    end
  end
end
