require_relative 'musicalbum'
require_relative 'genre'
require_relative 'label'
require_relative 'book'
require 'json'

class App
  attr_reader :genre, :music_album

  def initialize
    @genre = []
    @music_album = []
    @label = []
    @books = []
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
    add_genre(genre)
    add_label(color, title)
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

  def add_book
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

  def view_book
    @books.each do |book|
      puts '---------------'
      puts "Publisher: #{book.publisher}, Author:  #{book.author}"
      puts "Publish Date: #{book.publish_date}, Archived: #{book.archived}, Cover-State: #{book.cover_state}"
      puts '---------------'
    end
  end

  def store_music_album
    musicalbum = []
    @music_album.each do |music_album|
      music = { publish_date: music_album.publish_date, on_spotify: music_album.on_spotify }.to_h
      musicalbum.push(music)
    end
    file = File.open('store/music_album.json', 'w')
    file.puts(JSON.generate(musicalbum))
    file.close
  end

  def store_genre
    genres = []
    @genre.each do |genre|
      genre = { name: genre.name }.to_h
      genres.push(genre)
    end
    file = File.open('store/genre.json', 'w')
    file.puts(JSON.generate(genres))
    file.close
  end

  def store_label
    labels = []
    @label.each do |label|
      store_label = { color: label.color, title: label.title }.to_h
      labels.push(store_label)
    end
    file = File.open('store/label.json', 'w')
    file.puts(JSON.generate(labels))
    file.close
  end
end
