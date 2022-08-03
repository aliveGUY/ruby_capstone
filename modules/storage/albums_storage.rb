require 'json'
require_relative '../../lib/music_album'

module Storage
  def read_albums
    albums = []
    return albums if File.file?('data/albums.json') && File.zero?('data/albums.json')

    data = File.open('data/albums.json') { |f| JSON.parse(f.read) }
    data['albums'].each do |album|
      albums << MusicAlbum.new(publish_date: album['publish_date'], on_spotify: album['on_spotify'], id: album['id'])
      puts album['publish_date']
    end
    albums
  end

  def write_albums
    File.open('data/albums.json', 'w') do |file|
      albums = { 'albums' => [] }

      @albums.each do |album|
        albums['albums'] << { id: album.id,
                              publish_date: album.publish_date,
                              on_spotify: album.on_spotify }
      end
      json = JSON.pretty_generate(albums)
      file.write(json)
    end
  end
end
