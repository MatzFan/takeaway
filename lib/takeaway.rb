require 'twilio-ruby'

class Takeaway

  ACCOUNT_SID = ENV['TWILIO_AC_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']

  attr_reader :cell_num, :all_dishes

  def initialize
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    @all_dishes = {pizza: 5.5, curry: 7.5}
  end

  def place_order(order_details)
    order = Order.new({takeaway: self,
                       customer: order_details[:customer],
                       total: order_details[:total],
                       dishes: order_details[:dishes]})
  end

  def send_text(customer)
    @client.account.messages.create(
      :from => '441865922037',
      :to => customer.cell_num,
      :body => "Thank you! Your order was placed and will be delivered before" +
      " #{Time.now.hour+1}: #{time.now.min}")
  end

end # of class
