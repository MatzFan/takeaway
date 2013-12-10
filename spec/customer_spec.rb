require 'customer'

describe Customer do

  let(:customer) { Customer.new('07829929051') }

  context '#initialize' do
    it 'a customer should have a cellphone number recorded' do
      customer.cell_num.should == ('07829929051')
    end
  end

end # of describe
