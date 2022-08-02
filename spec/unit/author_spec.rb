require_relative '../../lib/author'

RSpec.describe Author do
  it 'should have a first name attribute'
  it 'should have a last name attribute'

  describe '#add_item' do
    it 'should receive an element of type Item as parameter'
    it 'should add the input item to the collection of items'
    it 'should add self as a property of the item object'
  end
end
