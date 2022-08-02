require_relative '../lib/label'

RSpec.describe Label do
  context 'When testig Label class' do
    let(:label) { Label.new(1, 'title1', 'blue') }
    let(:item) { instance_double('Item') }

    before do
      allow(item).to receive(:add_label)
    end

    it 'A new item should be added' do
      label.add_item(item)

      expect(label.items).to include(item)
    end

    it 'The title should be "title1"' do
      expect(label).to have_attributes(title: 'title1')
    end
  end
end
