require 'customer'

describe Customer do

  let(:customer) { Customer.new('+447829929051') }

  context '#initialize' do
    it 'a customer should have a cellphone number recorded' do
      customer.cell_num.should == ('+447829929051')
    end
  end

end # of describe
