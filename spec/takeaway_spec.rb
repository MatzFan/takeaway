require 'takeaway'

describe Takeaway do

  let(:takeaway) { Takeaway.new }

  context '#dishes' do
    it 'should list all the dishes' do
      takeaway.all_dishes.keys.should == ([:pizza, :curry])
    end

    it 'should list all the prices' do
      takeaway.all_dishes.values.should == ([5.5, 7.5])
    end
  end

end # of describe
