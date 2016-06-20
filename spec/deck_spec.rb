require 'spec_helper'

RSpec.describe Deck do
  describe 'initialize' do
    it 'has 52 cards in a deck' do
      expect(Deck.new.cards.count).to eq 52
    end

    it 'has 4 of each kind of card' do
      result = Deck.new.cards.map(&:name)
      expect(result.first(4).uniq).to eq ['A']
      expect(result.last(4).uniq).to eq ['2']
    end
  end

  describe '#shuffle' do
    it 'shuffles the deck' do
      original_deck = Deck.new
      shuffled_deck = original_deck.shuffle
      expect(original_deck).to_not eq shuffled_deck
    end
  end
end
