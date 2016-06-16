class Player
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def draw
    cards.pop
  end

  def take_all(items)
    cards.unshift(items)
    cards.flatten!
  end
end
