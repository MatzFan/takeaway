require 'order'

describe Order do

  let(:takeaway) { double('takeaway') }
  let(:order) { Order.new(13, {pizza: 2, curry: 3}) }

  context '#initialize' do
    it 'a customer should be able to place an order with dishes specified' do
      order.dishes.should == ({pizza: 2, curry: 3})
    end

    it 'a customer should be able to place an order with order total specified' do
      order.total.should == (13)
    end
  end

end # of describe
