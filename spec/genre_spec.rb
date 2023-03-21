require_relative '../classes/genre'

describe Genre do
  let(:genre) { Genre.new('Rock') }

  it 'has a name' do
    expect(genre.name).to eq('Rock')
  end
  it 'testing of add_item' do
    item = Item.new('Rock', 'author', 'source', 'label', 'date')
    genre.add_item(item)
    expect(genre.item).to include(item)
  end
end
