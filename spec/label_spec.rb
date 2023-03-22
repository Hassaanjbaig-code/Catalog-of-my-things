require_relative '../classes/label'
require_relative '../classes/item'
require 'date'

describe Label do
  describe '#add_item' do
    let(:label) { Label.new(1, 'red', 'Label 1') }
    let(:item) { Item.new(Date.today.prev_year) }


    it 'adds item to the label' do
      expect { label.add_item(item) }.to change { label.items.count }.by(1)
    end

    it 'sets label on the item' do
      label.add_item(item)
      expect(item.label).to eq(label)
    end
  end
end

