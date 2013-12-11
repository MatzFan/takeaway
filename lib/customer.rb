class Customer

  # if a class has no behaviour, it shouldn't exist in most cases

  attr_reader :cell_num

  def initialize(cell_num)
    @cell_num = cell_num
  end

end
