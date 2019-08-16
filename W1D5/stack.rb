class Stack

  def initialize
    @stack = []
  end

  def push(el)
    @stack << el
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end

end

stack = Stack.new
p stack.push(5)
p stack.push(10)
p stack.pop
p stack.push(15)
p stack.push("hello")
p stack.push("from")
p stack.push("stack")
begin
  stack.unshift
rescue => exception
  puts "Stack is LIFO, removing first element is not allowed"
end
p stack.pop
p stack.pop
p stack.push("world")
p stack.pop
p stack.pop
p stack.pop
p stack.pop
p stack.pop
p stack
