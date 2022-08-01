require 'item'

def menu
  puts '
      M E N U
  1) List all books
  2) List all music albums
  3) List all movies
  4) List of games
  5) List all genres
  6) List all labels
  7) List all authors
  8) List all sources
  9) Add a book
  10) Add a music album
  11) Add a movie
  12) Add a game
  '
end

def main
  loop do
    menu
    input = gets.chomp

    case input
    when '1'
      # @app.list_books
    when '2'
      # @app.list_people
    when '3'
      # @app.create_person
    when '4'
      # @app.create_book
    else
      break
    end
  end
end
main = Main.new
main.main
