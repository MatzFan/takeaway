class Array

  # That's a pretty cool recursive implementation, well done
  # I trust you can do it non-recursively as well
  def new_inject(memo = nil, sym = nil, &block)
    sym, memo = memo, nil if !sym && memo.class == Symbol
    block = sym.to_proc if !block_given?
    # result ||= nil # this line does absolutely nothing
    return memo if self.empty?
    memo ? memo = block.call(memo, self[0]) : memo = self[0]
    self[1..-1].new_inject(memo, &block)
  end

end
