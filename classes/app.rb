require_relative 'musicalbum'
require_relative 'genre'

class App
    attr_reader :genre, :music_album
    def initialize
        @genre = []
        @music_album = []
    end
    def Add_MusicAlbum
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
        puts 'Music album added'
    end
    def View_MusicAlbum
        @music_album.each do |music_album|
            puts "Publish date: #{music_album.publish_date}"
            puts "On spotify: #{music_album.on_spotify}"
        end
    end
    def Add_Genre
        puts 'What is the genre?'
        genre = gets.chomp
        genre = Genre.new(genre)
        @genre << genre
        puts 'Genre added'
    end
    def View_Genre
        @genre.each do |genre|
            puts "Genre: #{genre.name}"
        end
    end
end
