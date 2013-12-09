class Takeaway

  ACCOUNT_SID = ENV['TWILIO_AC_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']

  attr_reader :cell_num, :all_dishes

  def initialize
    @all_dishes = {pizza: 5.5, curry: 7.5}
  end

  def place_order(order_details)
    order = Order.new({takeaway: self,
                       customer: order_details[:customer],
                       total: order_details[:total],
                       dishes: order_details[:dishes]})
  end

end # of class
