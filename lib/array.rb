# class Array
#   def new_inject(initial = self[0], &block)
#     puts "self is #{self.inspect}"
#     if self.empty?
#       memo # base case
#     else
#       puts "On way in, inject now called on #{self[1..-1]}, with args (#{memo})"
#       memo = self[1..-1].new_inject(yield(intial, self[0]), &block)
#       puts "On way out, self is: #{self}, memo is: #{memo}"
#     end
#   end
# end

# p [1,6,2,3].new_inject { |memo, it| puts "memo and it in the block are #{memo}: #{it}"; memo += it }

# self.empty? ? [] : [yield(self[0])] + self[1..-1].map_recursive(&block)
