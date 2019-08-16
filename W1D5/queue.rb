class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.last
  end

end

queue =  Queue.new
p queue.enqueue(5)
p queue.enqueue(10)
p queue.dequeue
p queue.enqueue(15)
p queue.enqueue("hello")
p queue.enqueue("from")
p queue.enqueue("queue")
begin
  queue.pop
rescue => exception
  puts "Stack is FIFO, removing last element is not allowed, wait your turn"
end
begin
  queue.unshift(1000)
rescue => exception
  puts "Hey, no skipping! Get in the back of the queue like everybody else"
end
p queue.dequeue
p queue.dequeue
p queue.enqueue("world")
p queue.dequeue
p queue.dequeue
p queue.dequeue
p queue.dequeue
p queue.dequeue
p queue