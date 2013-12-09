class Order

  attr_reader :dishes, :total

  def initialize(total = 0, dishes)
    @total = total
    @dishes = dishes
    check_total
  end

  def check_total
    raise ArgumentError, "Order total is #{calc_total}, not #{total}" if calc_total != total
  end

  def calc_total
    all_dishes = {pizza: 5.5, curry: 7.5}
    total = 0
    dishes.each { |dish, quantity| total += all_dishes[dish] * quantity}
    total
  end

end # of class


dishes = {pizza: 5.5, curry: 7.5}
o = Order.new(18.5, {pizza: 2, curry: 1})
p o.calc_total
