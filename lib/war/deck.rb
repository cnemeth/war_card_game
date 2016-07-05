module CsnWar
  class Deck
    attr_accessor :cards

    def initialize(args={})
      @cards = populate_deck
    end

    def shuffle
      cards.shuffle!(random: srand)
    end

    private

    def populate_deck
      arr = []
      ranks.each do |rank|
        4.times do
          arr << CsnWar::Card.new(name: rank.first.to_s, rank: rank.last)
        end
      end

      arr
    end

    def ranks
      {
        'A': 14,
        'K': 13,
        'Q': 12,
        'J': 11,
        'T': 10,
        '9': 9,
        '8': 8,
        '7': 7,
        '6': 6,
        '5': 5,
        '4': 4,
        '3': 3,
        '2': 2
      }
    end
  end
end
