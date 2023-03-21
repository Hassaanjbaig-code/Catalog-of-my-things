class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(_genre, author, source, _label, publish_date)
    @genre = ''
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
    publish_date > 10
  end
end
