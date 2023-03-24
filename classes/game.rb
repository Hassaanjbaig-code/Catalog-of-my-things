require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    today = Date.today
    two_years_ago = Date.new(today.year - 2, today.month, today.day)
    super && Date.parse(@last_played_at) < two_years_ago
  end

  private :can_be_archived?
end