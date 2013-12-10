require 'takeaway'

describe Takeaway do

  let(:customer) { double('customer', {cell_num: '07829929051'}) }
  let(:takeaway) { Takeaway.new }
  let(:order_details) { {customer: customer, total: 18.5, dishes: {pizza: 2, curry: 1}} }
  let(:twilio_client) { double('twilio_client')}

  let(:order) { double('order') }

  context '#initialize' do
    it 'should be initialized with a list all the dishes' do
      takeaway.all_dishes.keys.should == ([:pizza, :curry])
    end

    it 'should should be initialized with a list all the prices' do
      takeaway.all_dishes.values.should == ([5.5, 7.5])
    end
  end

  context '#place_order' do
    xit 'a customer should be able to place a valid order and get a text' do
      twilio_client.should_receive
      takeaway.place_order(order_details)
    end
  end

end # of describe
