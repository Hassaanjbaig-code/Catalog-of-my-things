require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, author, publish_date, _archived, cover_state: 'good')
    super(publish_date)

    @publisher = publisher
    @cover_state = cover_state
    @author = author
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
