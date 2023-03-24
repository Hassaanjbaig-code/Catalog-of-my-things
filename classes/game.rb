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
    today = Date.today
    two_years_ago = Date.new(today.year - 2, today.month, today.day)
    super && @last_played < two_years_ago
  end
end
