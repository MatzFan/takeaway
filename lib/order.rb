class Order

  attr_reader :dishes, :total

  def initialize(total = 0, dishes = {})
    @total = total
    @dishes = dishes
  end

end # of class
