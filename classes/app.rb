require_relative 'musicalbum'

class App
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
end

app = App.new
app.Add_MusicAlbum
app.View_MusicAlbum