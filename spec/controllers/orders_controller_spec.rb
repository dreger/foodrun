require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
	describe 'testing routes' do
  	it 'visits an order' do
			order = create(:order)
			get :show, id: order.uid
			expect(response.status).to be(200)
  	end

  	it 'creates a new order' do
			post :create, order: {what: "Coffee", expires_in: 300}
			expect(Order.count).to be(1)
		end

		it 'gets the homepage' do
		  get :index
		  expect(response.status).to be(200)
	  end
  end
end
