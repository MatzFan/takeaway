require 'order'

describe Order do

  let(:customer) { double('customer', {cell_num: '+447829929051'}) }
  let(:takeaway) { double('takeaway', {ACCOUNT_SID: ENV['TWILIO_AC_SID'], AUTH_TOKEN: ENV['TWILIO_AUTH_TOKEN']}) }
  let(:twilio_client) { double('twilio_client') }
  let(:valid_order) { Order.new({takeaway: takeaway, customer: customer, total: 18.5, dishes: {pizza: 2, curry: 1}}) }
  let(:invalid_order) { Order.new({takeaway: takeaway, customer: customer, total: 18, dishes: {pizza: 2, curry: 1}}) }

  context '#initialize' do
    it 'a customer should be able to place an order with several dishes specified' do
      takeaway.stub(:send_text)
      valid_order.dishes.should == ({pizza: 2, curry: 1})
    end

    it 'a customer should be able to place an order with order total specified' do
      takeaway.stub(:send_text)
      valid_order.total.should == (18.5)
    end

    it 'if a customer provides correct total an error should not be raised' do
      lambda { valid_order }.should_not raise_error(InvalidOrderError)
    end

    it 'if a customer provides incorrect total an error should be raised' do
      lambda { invalid_order }.should raise_error(InvalidOrderError, 'Order total is £18.5, not £18')
    end

    it 'a valid order should send a text to the customer' do
      takeaway.stub(:send_text).and_return(customer)
      takeaway.should_receive(:send_text).with(customer)
      valid_order
    end
  end

end # of describe
