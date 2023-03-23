require_relative 'item'
require_relative 'app'
require_relative 'label'
require_relative 'book'

class Main
  def main
    app = App.new
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
      app.view_book
    when 4
      app.view_label
    when 5
      app.view_game
    when 6
      app.view_author
    when 7
      app.add_musicalbum
    when 8
     app.add_book
    when 9
      app.add_game
    when 10
      exit
    else
      puts 'Invalid choice'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end


main = Main.new
main.main
