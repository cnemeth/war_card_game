module CsnWar
  class Card
    attr_accessor :name, :rank

    VALID_NAMES = %w(A K Q J T 9 8 7 6 5 4 3 2).freeze
    VALID_RANKS = [14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2].freeze

    def initialize(args)
      @name = args.fetch(:name)
      @rank = args.fetch(:rank)
      validate_args!
    end

    def self.min(cards)
      sort(cards).first
    end

    def self.max(cards)
      sort(cards).last
    end

    def self.equal?(a,b)
      a.rank == b.rank
    end

    def self.sort_by_rank_ascending(cards)
      sort(cards)
    end

    def self.sort_by_rank_descending(cards)
      sort(cards).reverse
    end

    def self.name_for_rank(rank)
      VALID_NAMES[VALID_RANKS.index(rank)]
    end

    def self.make(rank)
      name = name_for_rank(rank)
      Card.new({name: name, rank: rank})
    end

    private

    def self.sort(cards)
      cards.sort_by{|c| c.rank}
    end

    def validate_args!
      valid_pairs = VALID_NAMES.zip(VALID_RANKS).to_h
      raise ArgumentError.new('Invalid args') unless valid_pairs.select{|k,v| k == name && v == rank}.any?
    end
  end
end
