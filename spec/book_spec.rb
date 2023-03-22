require_relative '../classes/book'

describe Book do
  it 'return the publisher' do
    book = Book.new('publisher', 'author', '2022-03-22', false)
    expect(book.publisher).to eq('publisher')
  end

  it 'returns the publish date' do
    book = Book.new('publisher', 'author', '2022-03-22', false)
    expect(book.publish_date).to eq('2022-03-22')
  end

  it 'returns the archived state' do
    book = Book.new('publisher', 'author', '2022-03-22', false)
    expect(book.archived).to eq(false)
  end

  it 'returns the author' do
    book = Book.new('publisher', 'author', '2022-03-22', false)
    expect(book.author).to eq('author')
  end
end
