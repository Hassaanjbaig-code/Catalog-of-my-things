require_relative '../classes/musicalbum'

describe MusicAlbum do
    let(:music_album) { MusicAlbum.new('Rock', 'author', 'source', 'label', 'date', true) }
    
    it 'has a author' do
        expect(music_album.author).to eq('author')
    end
    it 'has a source' do
        expect(music_album.source).to eq('source')
    end
    it 'testing of add_item' do
        expect(music_album.on_spotify).to eq(true)
    end
end
