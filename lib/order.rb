require 'takeaway'
require 'twilio-ruby'

class Order

  ACCOUNT_SID = ENV['TWILIO_AC_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']

  attr_reader :dishes, :total

  def initialize(takeaway, total = 0, dishes)
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    @takeaway = takeaway
    @total = total
    @dishes = dishes
    check_total
    send_text
  end

  def send_text
    @client.account.messages.create(
      :from => '+14159341234',
      :to => '+16105557069',
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
