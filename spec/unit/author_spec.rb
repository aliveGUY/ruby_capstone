require_relative '../../lib/author'

RSpec.describe Author do
  let(:author) { Author.new(first_name: 'Andres', last_name: 'Agudelo') }
  it 'should have a first name attribute' do
    expect(author).to have_attributes(first_name: 'Andres')
  end
  it 'should have a last name attribute' do
    expect(author).to have_attributes(last_name: 'Agudelo')
  end

  describe '#add_item' do
    let(:item) { instance_double('Item') }

    before do
      allow(item).to receive(:add_author)
      allow(item).to receive(:move_to_archive)
    end

    it 'should add the input item to the collection of items' do
      author.add_item(item: item)

      items_collection = author.items

      expect(items_collection).to include(item)
    end

    it 'should add self as a property of the item object' do
      author.add_item(item: item)

      expect(item).to have_received(:add_author)
    end

    context 'when the parameter is different than an Item' do
      it 'should raise a TypeError' do
        expect { author.add_item(item: 'Some string') }.to raise_error(TypeError)
      end
    end
  end
end
