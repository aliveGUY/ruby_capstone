require_relative '../lib/book'

RSpec.describe Book do
  context 'When testing book that can not be archived' do
    let(:book) { Book.new('2020-02-02', 'Emilia', 'good') }
    let(:book_publisher) { book.publisher }

    it 'Book should not be move to archived' do
      book.move_to_archive
      expect(book.archived).to eq false
    end

    it 'Book publisher should be equal to "Emilia"' do
      expect(book.publish_date).to eql(Date.parse('2020-02-02'))
    end
  end

  context 'When testing book that can be archived' do
    let(:book) { Book.new('2000-02-02', 'Emilia', 'bad') }
    let(:book_cover) { book.cover_state }

    it 'Book should not be move to archived' do
      book.move_to_archive
      expect(book.archived).to eq true
    end

    it 'Book publisher should be equal to "Emilia"' do
      expect(book_cover).to eq('bad')
    end
  end
end
