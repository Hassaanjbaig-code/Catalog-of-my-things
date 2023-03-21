require_relative 'item'

class Genre
  attr_reader :item
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @item = []
  end
  def add_item(item)
    @item << item
    item.genre = self
  end
end
