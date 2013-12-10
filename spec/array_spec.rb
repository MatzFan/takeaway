require 'array'

describe Array do
  context '#new_inject' do

   let(:array) { [4,6,2,3] }
   let(:block) { Proc.new { |e| e * 2 } }

    it "should be recognised by the Array class" do
      array.respond_to?(:new_inject).should be_true
    end

    it "should not mutate the array it is called on" do
      original = array
      array.new_inject {}
      array.should equal(array)
    end

    it "should take a block, or symbol arg - not neither" do
      lambda { array.new_inject }.should raise_error(LocalJumpError)
    end

    it "should act like inject with a symbol if a symbol is given" do
      lambda { array.new_inject(:*) }.should == array.inject(&block)
    end

    it 'should behave like inject!' do
      array.new_inject(&block).should == array.inject(&block)
    end
  end

end # of describe
