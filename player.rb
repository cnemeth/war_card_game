require 'faker'

class Player
  attr_accessor :name, :cards

  def initialize
    @name = Faker::Name.first_name
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
