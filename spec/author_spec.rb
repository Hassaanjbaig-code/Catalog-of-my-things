require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  it 'returns the first name' do
    author = Author.new('first_name', 'last_name')
    expect(author.first_name).to eq('first_name')
  end

  it 'returns the last name' do
    author = Author.new('first_name', 'last_name')
    expect(author.last_name).to eq('last_name')
  end

  it 'returns the items' do
    author = Author.new('first_name', 'last_name')
    expect(author.items).to eq([])
  end

  it 'adds item to the author' do
    author = Author.new('first_name', 'last_name')
    item = Item.new('23-3-2023')
    expect { author.add_item(item) }.to change { author.items.count }.by(1)
  end
end
