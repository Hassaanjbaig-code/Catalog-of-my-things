require_relative 'musicalbum'
require_relative 'genre'
require_relative 'label'

class App
  attr_reader :genre, :music_album

  def initialize
    @genre = []
    @music_album = []
    @label = []
  end

  def add_musicalbum
    puts 'Add Genre:'
    genre = gets.chomp
    puts 'Title of the album:'
    title = gets.chomp
    puts 'Color of the label:'
    color = gets.chomp
    puts 'What is the publish date? [yyyy-mm-dd]'
    date = gets.chomp
    puts 'Is it on spotify?  (y/n)'
    spotify = gets.chomp
    case spotify
    when 'y'
      spotify = true
    when 'n'
      spotify = false
    else
      puts 'Invalid choice'
      exit
    end
    music_album = MusicAlbum.new(date, spotify)
    @music_album << music_album
    Add_Genre(genre)
    Add_label(color, title)
    puts 'Music album added'
  end

  def view_musicalbum
    puts '---------------'
    @music_album.each do |music_album|
      puts "Publish date: #{music_album.publish_date}"
      puts "On spotify: #{music_album.on_spotify}"
    end
    puts '---------------'
  end

  def add_genre(genre)
    genre = Genre.new(genre)
    @genre << genre
  end

  def view_genre
    puts '---------------'
    @genre.each do |genre|
      puts "Genre: #{genre.name}"
    end
    puts '---------------'
  end

  def add_label(color, title)
    label = Label.new(color, title)
    @label << label
  end

  def view_label
    puts '---------------'
    @label.each do |label|
      puts "Color: #{label.color}"
      puts "Title: #{label.title}"
    end
    puts '---------------'
  end
end
