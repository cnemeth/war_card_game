require 'faker'

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
    cards.unshift(items)
    cards.flatten!
  end

  private

  def _name
    @name ||= Faker::Name.first_name
  end

  def _id
    @id ||= object_id.to_s[-5..-1]
  end
end
