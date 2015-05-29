require 'rails_helper'

RSpec.describe Item, :type => :model do
  describe 'validating the model' do
		it 'ensures that a :name is provided' do
			item = build(:item, name: "")
			expect(item.valid?).to be(false)
		end

		it 'ensures that a :description is provided' do
			item = build(:item, description: "")
			expect(item.valid?).to be(false)
		end
  end
end
