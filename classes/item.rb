class Item
  attr_reader :id, :genre, :archived
  attr_accessor  :author, :source, :label, :publish_date

  def initialize( author, source, _label, publish_date)
    super()
    @author = author
    @source = source
    @publish_date = publish_date
    @archived = archived
    @label = nil
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
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

# item = Item.new('author', 'source', 'label', 'date')
# puts item.genre('genre')