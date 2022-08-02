require_relative 'game'

class App
  def initialize
    @games = []
    @authors = []
  end

  def list_authors
    puts 'Authors: '
    @authors.each { |author| puts "#{author.first_name} #{author.last_name}" }
  end

  def list_games
    puts 'Games: '
    @games.each_with_index do |game, i|
      puts "Game #{i + 1}
        published at: #{game.publish_date}
        #{game.multiplayer ? 'Multiplayer' : 'Single player'}
        last played at: #{game.last_played_at}
        "
    end
  end

  def create_game(publish_date, multiplayer, last_played_at)
    @games << Game.new(publish_date: publish_date, multiplayer: multiplayer, last_played_at: last_played_at)
  end
end
