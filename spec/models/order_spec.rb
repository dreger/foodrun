require 'rails_helper'

RSpec.describe Order, :type => :model do
  describe 'validating the model' do
		it 'creates the uid' do
			order = create(:order)
			expect(order.uid.length).to be(Order::UID_HEX_LENGTH)
		end

		it 'sets the correct expires_on' do
			order = create(:order, expires_in: 60)
			result = order.expires_on - order.created_at
			expect(result.to_i).to eq(60)
		end

		it 'ensures that a :what is provided' do
			order = build(:order, what: "")
			expect(order.valid?).to be(false)
		end
  end
end
