require_relative '../classes/item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @id = Random.rand(1..1000)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super || Date.parse(@last_played_at) < 2.years.ago
  end
end
