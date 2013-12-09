class Array
  def new_inject(memo = nil, &block)
    memo ||= self[0]
    result ||= nil
    puts "self is #{self.inspect}"
    if self.empty?
      return memo
    else
      puts "self[0] is: #{self[0]}"
      memo = yield(memo, self[0])
      puts "On way in, inject now called on #{self[1..-1]}, with args (#{memo})"
      result = self[1..-1].new_inject(memo, &block)
      puts "On way out, self is: #{self}, memo is: #{memo}"
    end
    return result
  end
end

puts [4,6,2,3].new_inject { |memo, e| memo += e }

puts [4,6,2,3].inject { |memo, e| memo += e }

