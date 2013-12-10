require 'order'

describe Order do

  let(:takeaway) { double('takeaway') }
  let(:twilio_client) { double('twilio_client') }
  let(:valid_order) { Order.new({takeaway: takeaway, total: 18.5, dishes: {pizza: 2, curry: 1}}) }
  let(:invalid_order) { Order.new({takeaway: takeaway, total: 18, dishes: {pizza: 2, curry: 1}}) }

  context '#initialize' do
    it 'a customer should be able to place an order with several dishes specified' do
      valid_order.dishes.should == ({pizza: 2, curry: 1})
    end

    it 'a customer should be able to place an order with order total specified' do
      valid_order.total.should == (18.5)
    end

    it 'if a customer provides correct total an error should not be raised' do
      lambda { valid_order }.should_not raise_error(InvalidOrderError)
    end

    it 'if a customer provides incorrect total an error should be raised' do
      lambda { invalid_order }.should raise_error(InvalidOrderError, 'Order total is £18.5, not £18')
    end

    it 'a valid order should send a text to the customer' do
      lambda { invalid_order }.should raise_error(InvalidOrderError, 'Order total is £18.5, not £18')
    end
  end

end # of describe
