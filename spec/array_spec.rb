# require 'array'

# describe Array do
#   context '#new_inject' do

#    let(:array) { [1,6,2,3] }
#    let(:block) { Proc.new { |e| e * 2 } }

#     it "should be recognised by the Array class" do
#       array.respond_to?(:new_inject).should be_true
#     end

#     it "should not mutate the array it is called on" do
#       original = array
#       array.new_inject {}
#       array.should equal(array)
#     end

#     it "should return an array" do
#       array.new_inject{}.class.should == Array
#     end

#     it "should have to take a block arg" do
#       lambda { array.new_inject }.should raise_error(LocalJumpError)
#     end

#     it "should return the same number of elements as the array it is called on" do
#       array.new_inject{ 'a block' }.length.should == 3
#     end

#     it "should return an array with the elements modified by the block arg" do
#       array.new_inject { |n| n * 2 }.should == [2,4,6]
#     end
#   end

# end # of describe
