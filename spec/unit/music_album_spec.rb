require_relative '../../lib/music_album'

RSpec.describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new(publish_date: '01-01-2002')
  end

  describe '#new' do
    it 'should create a new MusicAlbum object' do
      expect(@music_album).to be_an_instance_of MusicAlbum
    end
  end

  describe '#can_be_archived?' do
    it 'should override the method from the parent class' do
      expect { @music_album.can_be_archived? }.to_not raise_error
    end

    it 'should return true if parent`s method returns true AND if on_spotify equals true' do
      @music_album.on_spotify = true
      expect(@music_album.can_be_archived?).to eql true
    end

    it 'otherwise, it should return false' do
      @music_album.on_spotify = false
      expect(@music_album.can_be_archived?).to eql false
    end
  end
end
