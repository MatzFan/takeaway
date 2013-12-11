require 'takeaway'

describe Takeaway do

  let(:customer) { double('customer', {cell_num: '+447829929051'}) }
  let(:takeaway) { Takeaway.new }
  let(:order_details) { {customer: customer, total: 18.5, dishes: {pizza: 2, curry: 1}} }
  let(:order) { double('order', {customer: customer, total: 18.5, dishes: {pizza: 2, curry: 1}}) }
  let(:twilio_client) { double('twilio_client')}

  context '#initialize' do
    # no, this should be a constant
    it 'should be initialized with a list all the dishes' do
      takeaway.all_dishes.keys.should == ([:pizza, :curry])
    end
    # and you wouldn't test it anyway
    it 'should should be initialized with a list all the prices' do
      takeaway.all_dishes.values.should == ([5.5, 7.5])
    end
  end

  context '#place_order' do
    # Nope, this test tests exactly nothing. Because you stubbed it out
    # the real code is not even run, so the test would never ever fail
    it 'should be able to receive a valid order for a customer' do
      takeaway.stub(:place_order).and_return(order)
      takeaway.place_order(order_details).should == order
    end
  end

end # of describe
