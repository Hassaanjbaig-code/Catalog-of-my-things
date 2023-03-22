require_relative 'item'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(id, color, title)
    @id = rand(1..100)
    @color = color
    @title = title
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
