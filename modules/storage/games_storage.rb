require 'json'
require_relative '../../lib/game'

module Storage
  def read_games
    if File.file?('data/games.json')
      games = []
      hash = File.open('data/games.json') { |f| JSON.parse(f.read) }
      hash['games'].each do |game|
        games << Game.new(id: game['id'], publish_date: game['publish_date'], multiplayer: game['multiplayer'],
                          last_played_at: game['last_played_at'])
      end
      return games
    end
    []
  end

  def write_games
    File.open('data/games.json', 'w') do |file|
      data_hash = { 'games' => [] }

      @games.each do |game|
        data_hash['games'] << { id: game.id,
                                publish_date: game.publish_date,
                                multiplayer: game.multiplayer,
                                last_played_at: game.last_played_at }
      end
      json = JSON.pretty_generate(data_hash)
      file.write(json)
    end
  end
end
