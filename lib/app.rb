require_relative 'game'
require_relative 'music_album'
require_relative 'book'
require_relative '../modules/storage/storage'

class App
  include Storage
  def initialize
    @games = read_games
    @authors = []
    @albums = []
    @books = read_books
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

  def list_all_music_albums
    @albums.each_with_index do |album, i|
      puts "#{i + 1}) published at: #{album.publish_date} #{album.on_spotify ? 'on spotify' : ''}"
    end
  end

  def list_all_genres
    puts 'not implemented yet'
  end

  def create_game(publish_date, multiplayer, last_played_at)
    @games << Game.new(publish_date: publish_date, multiplayer: multiplayer, last_played_at: last_played_at)
  end

  def create_album(publish_date, on_spotify)
    @albums << MusicAlbum.new(publish_date: publish_date, on_spotify: on_spotify)
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

  def save_data
    write_games
    save_books(@books)
  end
end
