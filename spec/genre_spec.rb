require_relative '../lib/genre'
require_relative '../lib/item'
require 'rspec'

RSpec.describe Genre do
  before :each do
    @genre = Genre.new('foo')
  end

  describe '#new' do
    it 'should create a new Genre object' do
      expect(@genre).to be_instance_of(Genre)
    end
  end

  describe '#add_item' do
    before :each do
      @item = Item.new(publish_date: '01-01-2002')
    end

    it 'should take an instance of the Item class as an input' do
      expect { @genre.add_item(@item) }.not_to raise_error
    end

    it 'should add the input item to the collection of items' do
      @genre.add_item(@item)
      expect(@genre.items).to_not be_nil
    end

    it 'should add self as a property of the item object' do
      @genre.add_item(@item)
      expect(@genre.items).to eql [@item]
    end
  end
end
