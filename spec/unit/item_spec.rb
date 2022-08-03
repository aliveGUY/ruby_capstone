require_relative '../../lib/item'
require 'date'

RSpec.describe Item do
  let(:item) { Item.new(id: 15, publish_date: '2022-08-03') }
  it 'should have a published date' do
    expect(item).to have_attributes(publish_date: Date.parse('2022-08-03'))
  end
  it 'should have an id' do
    expect(item).to have_attributes(id: 15)
  end

  describe '#add_author' do
    let(:author) { instance_double('Author') }

    before do
      allow(author).to receive(:add_item).with(item: item)
      allow(author).to receive(:items).and_return([])
    end

    it 'should assign an author to it' do
      item.add_author(author)

      expect(item).to have_attributes(author: author)
    end

    it 'should assign the item to the author' do
      item.add_author(author)

      expect(author).to have_received(:add_item)
    end
  end

  describe '#add_label' do
    let(:label) { instance_double('Label') }

    before do
      allow(label).to receive(:add_item).with(item)
      allow(label).to receive(:items).and_return([])
    end

    it 'should assign a label to it' do
      item.add_label(label)

      expect(item).to have_attributes(label: label)
    end
    it 'should assign the item to the label' do
      item.add_label(label)

      expect(label).to have_received(:add_item)
    end
  end

  describe '#add_genre' do
    let(:genre) { instance_double('Genre') }

    before do
      allow(genre).to receive(:add_item).with(item)
      allow(genre).to receive(:items).and_return([])
    end

    it 'should assign a genre to it' do
      item.add_genre(genre)

      expect(item).to have_attributes(genre: genre)
    end
    it 'should assign the item to the genre' do
      item.add_genre(genre)

      expect(genre).to have_received(:add_item)
    end
  end

  context 'when the published date is older than 10 years' do
    let(:item) { Item.new(id: 15, publish_date: '2000-08-03') }

    it 'should be moved to archived' do
      item.move_to_archive

      expect(item).to have_attributes(archived: true)
    end
  end
end
