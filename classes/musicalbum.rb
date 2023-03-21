require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  # rubocop:disable Metrics/ParameterLists
  def initialize(author, source, label, publish_date, on_spotify)
    super(author, source, label, publish_date)
    @on_spotify = on_spotify
  end
  # rubocop:enable Metrics/ParameterLists

  private

  def can_be_archived?
    super && @on_spotify
  end
end
