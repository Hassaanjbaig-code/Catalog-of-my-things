require_relative 'item'
require_relative 'app'

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
    home_page_choice(choice,app)
  end

  def home_page_choice(choice,app)
    case choice
    when 1
        app.View_MusicAlbum
    when 2
        app.View_Genre
    when 3
        app.View_Book
    when 4
        app.View_Label
    when 5
        app.View_Game
    when 6
        app.View_Author
    when 7
        app.Add_MusicAlbum
    when 8
        app.Add_Book
    when 9
        app.Add_Game
    when 10
        exit
    else
      puts 'Invalid choice'
    end
  end
end

main = Main.new
main.main
