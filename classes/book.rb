require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :label

  def initialize(publisher, author, publish_date, _archived, cover_state: 'good')
    super(publish_date)

    @publisher = publisher
    @cover_state = cover_state
    @author = author
    @books = []
    @label = []
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def self.add_book
    puts 'What is the author?'
    author = gets.chomp
    puts 'What is the publisher?'
    publisher = gets.chomp
    puts 'What is the publish date?'
    date = gets.chomp
    puts 'What is the cover state? (good/bad)'
    cover_state = gets.chomp
    puts 'What is the label title?'
    title = gets.chomp
    puts 'What is the label color?'
    color = gets.chomp

    book = Book.new(publisher, author, date, false, cover_state: cover_state)
    @books << book
    label = Label.new(color, title)
    book.label = label
    @label << label

    puts 'Book added!'
    book
  end

  def self.view_book
    @books.each do |book|
      puts '---------------'
      puts "Publisher: #{book.publisher}, Author:  #{book.author}"
      puts "Publish Date: #{book.publish_date}, Archived: #{book.archived}, Cover-State: #{book.cover_state}"
      puts '---------------'
    end
  end

  def self.view_label
    @label.each do |book|
      puts '---------------'
      puts "Color: #{book.color}, Title:  #{book.title}"
      puts '---------------'
    end
  end

  def self.store_books
    books = []
    @books.each do |book|
      book_data = {
        publisher: book.publisher,
        author: book.author,
        publish_date: book.publish_date,
        archived: book.archived,
        cover_state: book.cover_state
      }
      books << book_data
    end
    file = File.open('store/books.json', 'w')
    file.puts(JSON.generate(books))
    file.close
  end

  def self.load_file_books
    @books = []
    file = File.read('store/books.json')
    data_hash = JSON.parse(file)
    data_hash.each do |book_data|
      @books << Book.new(book_data['publisher'], book_data['author'], book_data['publish_date'], book_data['archived'],
                         cover_state: book_data['cover_state'])
    end
  end

  def self.store_label
    labels = []
    @label.each do |label|
      store_label = { color: label.color, title: label.title }.to_h
      labels.push(store_label)
    end
    file = File.open('store/label.json', 'w')
    file.puts(JSON.generate(labels))
    file.close
  end

  def self.load_file_label
    @label = [] # Ensure that @label is initialized as an empty array
    load_file_books # Populate @books and, subsequently, @label
    file = File.read('store/label.json')
    data_hash = JSON.parse(file)
    data_hash.each do |label|
      @label << Label.new(label['color'], label['title'])
    end
  end
end
