require_relative 'game'
require_relative 'book'

class App
  def initialize
    @games = []
    @authors = []
    @books = []
    @label = []
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

  # label and book
  def list_label
    @label.each do |label|
      puts "ID: #{label.id}, Title: #{label.title}, Color: #{label.color}, Items: #{label.items}"
    end
  end

  def list_books
    @books.each do |book|
      puts "Publish date: #{book.publish_date}, Publisher: #{book.publisher}, Cover state: #{book.cover_state}"
    end
  end

  def create_book(publish_date, publisher, cover_state)
    @books << Book.new(publish_date, publisher, cover_state)
  end
end
