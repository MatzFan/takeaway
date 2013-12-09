require 'order'

describe Order do

  let(:takeaway) { double('takeaway') }
  let(:valid_order) { Order.new(13, {pizza: 2}, {curry: 3}) }
  let(:invalid_order) { Order.new(12, {pizza: 2}, {curry: 3}) }

  context '#initialize' do
    it 'a customer should be able to place an order with several dishes specified' do
      valid_order.dishes.should == ([{pizza: 2}, {curry: 3}])
    end

    it 'a customer should be able to place an order with order total specified' do
      valid_order.total.should == (13)
    end

    it 'should calculate its total value' do
      lambda { invalid_order }.should raise_error(IncorrectTotal, 'Order total is £13, not £12')
    end

    xit 'if a customer provides incorrect total an error should be reaised' do
      lambda { invalid_order }.should raise_error(IncorrectTotal, 'Order total is £13, not £12')
    end
  end

end # of describe
