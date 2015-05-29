require 'rails_helper'

RSpec.describe ItemsController, :type => :controller do
	describe 'testing routes' do
  	it 'creates a new item' do
  		order = create(:order)
			post :create, item: {name: "Kyle", description: "Coffee", order_id: 1}, format: :js
			expect(Item.count).to be(1)
		end
  end
end
