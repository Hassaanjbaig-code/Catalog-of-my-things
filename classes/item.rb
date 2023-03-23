class Item
  attr_reader :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date)
    @id = rand(1..1000)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def label=(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def author=(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  private

  def can_be_archived?
    publish_date < Date.today - 10.years
  end
end
