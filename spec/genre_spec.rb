require_relative '../lib/genre'

RSpec.describe Genre do
  let(:genre) { Genre.new('foo') }

  describe '#new' do
    it 'should create a new Genre object' do
      expect(genre).to be_instance_of(Genre)
    end
  end

  describe '#add_item' do
    let(:item) { double('Item') }
    before :each do
      allow(item).to receive(:add_genre)
    end

    it 'should take an instance of the Item class as an input' do
      expect { genre.add_item(item) }.not_to raise_error
    end

    it 'should add the input item to the collection of items' do
      genre.add_item(item)
      expect(genre.items).to_not be_nil
    end

    it 'should add self as a property of the item object' do
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
