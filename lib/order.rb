require 'takeaway'
require 'customer'

class Order

  attr_reader :dishes, :total, :takeaway, :customer

  def initialize(args)
    @takeaway = args[:takeaway]
    @customer = args[:customer]
    @total = args[:total] || 0
    @dishes = args[:dishes]
    check_total
    takeaway.send_text(customer)
  end

  def check_total
    raise InvalidOrderError,
    "Order total is £#{calc_total}, not £#{total}" if calc_total != total
  end

  def calc_total
    all_dishes = {pizza: 5.5, curry: 7.5}
    dishes.inject(0) { |total, dish| total += all_dishes[dish.first] * dish.last}
  end

end # of class


class InvalidOrderError < ArgumentError

end

# dishes = {pizza: 5.5, curry: 7.5}
# o = Order.new(18.5, {pizza: 2, curry: 1})
# p o.calc_total
