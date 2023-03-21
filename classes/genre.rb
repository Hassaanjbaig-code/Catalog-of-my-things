require_relative 'item'

class Genre
  attr_reader :item
  attr_accessor :name

  def initialize(name)
    @id = Ramdon.rand(1..1000)
    @name = name
    @item = []
  end
end
