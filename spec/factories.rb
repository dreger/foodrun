FactoryGirl.define do
  factory :order do
  	id 1
    what "Coffee"
		expires_in 300
  end

  factory :item do
    id 1
    order_id 1
    name "Kyle"
    description "Black coffee, hold the sugar"
  end
end
