require_relative '../classes/musicalbum'

describe MusicAlbum do
  let(:music_album) { MusicAlbum.new('2022-12-12', true) }

  it 'has a Date' do
    expect(music_album.publish_date).to eq('2022-12-12')
  end
  it 'testing of add_item' do
    expect(music_album.on_spotify).to eq(true)
  end
end
