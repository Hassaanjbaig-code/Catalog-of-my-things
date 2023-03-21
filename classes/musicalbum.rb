require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(author, source, label, publish_date, on_spotify)
    super(author, source, label, publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
