module CsnWar
  class Player
    attr_accessor :id, :name, :cards

    def initialize
      @name = _name
      @id = _id
      @cards = []
    end

    def draw
      cards.pop
    end

    def take_all(items)
      arr = make_cards(items)
      insert(arr)
    end

    private

    def insert(arr)
      cards.unshift(arr)
      cards.flatten!
    end

    def make_cards(items)
      arr = []
      items.each do |item|
        card = Card.make(item.to_i)
        if card
          arr << card
        end
      end

      arr
    end

    def _name
      @name ||= Faker::Name.first_name
    end

    def _id
      @id ||= object_id.to_s[-5..-1]
    end
  end
end
