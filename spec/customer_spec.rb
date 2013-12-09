require 'customer'

describe Customer do

  let(:customer) { Customer.new('0123456789') }

  context '#initialize' do
    it 'a customer should have a cellphone number recorded' do
      customer.cell_num.should == ('0123456789')
    end
  end

end # of describe
