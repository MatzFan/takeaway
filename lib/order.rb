require 'takeaway'
require 'twilio-ruby'

class Order

  attr_reader :dishes, :total, :takeaway

  def initialize(args)
    @takeaway = args[:takeaway]
    @client = Twilio::REST::Client.new takeaway::ACCOUNT_SID,
                                       takeaway::AUTH_TOKEN
    @customer = args[:customer]
    @total = args[:total] || 0
    @dishes = args[:dishes]
    check_total
    send_text
  end

  def send_text
    @client.account.messages.create(
      :from => @takeaway.cell_num,
      :to => @customer.cell_num,
      :body => "Thank you! Your order was placed and will be delivered before" +
      " #{Time.now - 3_600}")
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
