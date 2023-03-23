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
end