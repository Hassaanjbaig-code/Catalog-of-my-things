class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

  # rubocop:disable Metrics/ParameterLists
  def initialize(genre, author, source, _label, publish_date, archived: false)
    @genre = genre
    @author = author
    @source = source
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  private

  def can_be_archived?
    publish_date < Date.today - 10.years
  end
end
