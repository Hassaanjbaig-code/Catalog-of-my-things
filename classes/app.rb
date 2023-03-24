require_relative 'musicalbum'
require_relative 'genre'
require_relative 'label'
require_relative 'book'
require_relative 'game'
require_relative 'author'
require 'json'

class App
  attr_reader :genre, :music_album

  def initialize
    @genre = []
    @music_album = []
    @label = []
    @games = []
    @authors = []
  end

  def add_musicalbum
    puts 'Add Genre:'
    genre = gets.chomp
    puts 'Title of the label:'
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
  def add_game
    puts 'Is it multiplayer? (y/n)'
    multiplayer = gets.chomp
    case multiplayer
    when 'y'
      multiplayer = true
    when 'n'
      multiplayer = false
    else
      puts 'Invalid choice'
      exit
    end
    puts 'What is the last played date? [yyyy-mm-dd]'
    last_played_at = gets.chomp
    puts 'What is the publish date? [yyyy-mm-dd]'
    publish_date = gets.chomp
    puts 'What is the first name?'
    first_name = gets.chomp
    puts 'What is the last name?'
    last_name = gets.chomp


    game = Game.new(multiplayer, last_played_at, publish_date)
    @games << game
    add_author(first_name, last_name)
    puts 'Game added!'
  end

  def view_game
    puts '---------------'
    @games.each do |game|
      puts "Multiplayer: #{game.multiplayer}, Last played: #{game.last_played_at}"
      puts "Publish date: #{game.publish_date}"
    end
    puts '---------------'
  end

  def add_author(first_name, last_name)
    author = Author.new(first_name, last_name)
    @authors << author
  end

  def view_author
    puts '---------------'
    @authors.each do |author|
      puts "First name: #{author.first_name}, Last name: #{author.last_name}"
    end
    puts '---------------'
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

  def store_game
    games = []
    @games.each do |game|
      game = { multiplayer: game.multiplayer, last_played_at: game.last_played_at, publish_date: game.publish_date }.to_h
      games.push(game)
    end
      file = File.open('store/game.json', 'w') 
      file.puts(JSON.generate(games))
      file.close
    end
  

  def store_author
 authors = []
    @authors.each do |author|
      author = { first_name: author.first_name, last_name: author.last_name }
      authors.push(author)
    end
    file = File.open('store/author.json', 'w')
    file.puts(JSON.generate(authors))
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

  def load_file_genre
    file = File.read('store/genre.json')
    data_hash = JSON.parse(file)
    data_hash.each do |genre|
      @genre << Genre.new(genre['name'])
    end
  end

  def load_file_game
    file = File.read('store/game.json')
    data_hash = JSON.parse(file)
    data_hash.each do |game|
      @games << Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
    end
  end

  def load_file_author
    file = File.read('store/author.json')
    data_hash = JSON.parse(file)
    data_hash.each do |author|
      @authors << Author.new(author['first_name'], author['last_name'])
    end
  end
  def load_file_label
    file = File.read('store/label.json')
    data_hash = JSON.parse(file)
    data_hash.each do |label|
      @label << Label.new(label['color'], label['title'])
    end
  end

  def load_file_music_album
    file = File.read('store/music_album.json')
    data_hash = JSON.parse(file)
    data_hash.each do |music_album|
      @music_album << MusicAlbum.new(music_album['publish_date'], music_album['on_spotify'])
    end
  end
end
