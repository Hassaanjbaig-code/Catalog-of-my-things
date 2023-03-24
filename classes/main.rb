require_relative 'item'
require_relative 'app'
require_relative 'book'

class Main
  def main
    app = App.new
    app.load_file_genre
    app.load_file_music_album
    app.load_file_label
    app.load_file_game
    app.load_file_author
    Book.load_file_books
    Book.load_file_label
    puts 'Welcome to my app'
    loop do
      home_page(app)
    end
  end

  def home_page(app)
    puts 'What would you like to do?'
    puts [
      '1 => List all Music_Albums',
      '2 => List all Genres',
      '3 => List all books',
      '4 => List all Labels',
      '5 => List all Games',
      '6 => List all Authors',
      '7 => Create an Music Album',
      '8 => Create a Book',
      '9 => Create a Game',
      '10 => Exit'
    ]
    print 'Select a number: '
    choice = gets.chomp.to_i
    address(choice, app)
  end

  # rubocop:disable Metrics/CyclomaticComplexity

  def address(choice, app)
    case choice
    when 1
      app.view_musicalbum
    when 2
      app.view_genre
    when 3
      Book.view_book
    when 4
      app.view_label
    when 5
      app.view_game
    when 6
      app.view_author
    when 7
      app.add_musicalbum
    when 8
      Book.add_book
    when 9
      app.add_game
    when 10
      app.store_music_album
      app.store_genre
      app.store_label
      app.store_game
      app.store_author
      Book.store_label
      Book.store_books
      exit
    else
      puts 'Invalid choice'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
