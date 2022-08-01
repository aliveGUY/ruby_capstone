require_relative '../lib/musicAlbum'
require_relative '../lib/item'
require 'rspec'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('foo')
  end

  describe '#new' do 
    it 'should create a new MusicAlbum object'
      expect(@music_album).to be_an_instance_of MusicAlbum
    end
  end

  describe '#can_be_archived?'
    it 'should override the method from the parent class'
    
    end
  end
end