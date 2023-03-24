require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  before(:each) do
    @genre = Genre.new('Rock')
    @item = Item.new('date')
    @item1 = Item.new('date')
  end
  it 'has a name' do
    expect(@genre.name).to eq('Rock')
  end
  it 'has a item' do
    expect(@genre.items).to eq([])
  end
  it 'testing of add_item' do
    @genre.add_item(@item)
    @genre.add_item(@item1)
    lenght = @genre.items.length
    expect(@genre.items.length).to eq(lenght)
  end
end
