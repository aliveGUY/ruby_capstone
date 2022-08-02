require 'json'
require_relative '../../lib/book'

module Storage
  def read_books
    file = 'data/books.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Book.new(element['publish_date'], element['publisher'], element['cover_state']))
      end
    end
    data
  end

  def save_books(books)
    data = []
    books.each do |book|
      data.push({ publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state })
    end
    File.write('data/books.json', JSON.pretty_generate(data))
  end
end
