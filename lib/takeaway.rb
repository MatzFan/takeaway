class Takeaway

  attr_reader :all_dishes

  def initialize
    @all_dishes = {pizza: 5.5, curry: 7.5}
  end

  def order(args)
    args[:quantity] ||= 1

  end

end # of class
