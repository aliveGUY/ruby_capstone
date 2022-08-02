require_relative '../lib/book'

RSpec.describe Book do
  context 'When testing book that can not be archived' do
    book = Book.new('2020-02-02', 'Emilia', 'good')
    book_publisher = book.publisher
    book_archived = book.archived

    it 'Book should not be move to archived' do
      expect(book_archived).to eq false
    end

    it 'Book publisher should be equal to "Emilia"' do
      expect(book_publisher).to eql('Emilia')
    end
  end

  context 'When testing book that can be archived' do
    book = Book.new('2000-02-02', 'Emilia', 'bad')
    book_archive = book.move_to_archive
    book_cover = book.cover_state

    it 'Book should not be move to archived' do
      expect(book_archive).to eq true
    end

    it 'Book publisher should be equal to "Emilia"' do
      expect(book_cover).to eq('bad')
    end
  end
end
