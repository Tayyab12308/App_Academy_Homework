require 'byebug'
class Map

  attr_accessor :map 
  def initialize
    @map = []
  end

  def set(key, value)
    if self.map.empty? || !keys.include?(key)
      self.map << [key, value]
    else
      i = 0
      while i < self.map.length
        self.map[i][1] = value if self.map[i][0] == key
        i += 1
      end
    end
    self.map
  end
  
  def keys
    self.map.map { |pair| pair.first }
  end


  def get(key)
    i = 0
    while i < self.map.length
      return self.map[i] if self.map[i][0] == key
      i += 1
    end
    nil
  end

  def delete(key)
    slice_el = get(key)
    if self.map.include?(slice_el)
      idx = self.map.index(slice_el)
      self.map = self.map[0...idx] + self.map[(idx + 1)..-1]
    else
      raise "That element does not exist"
    end
  end

  def show
    p self.map
  end

end

map = Map.new
p map.set(0,1)              #  [[0, 1]]
p map.set(2,1)              # [[0, 1], [2, 1]]
p map.set(3,2)              # [[0, 1], [2, 1], [3, 2]]
p map.set(4,7)              # [[0, 1], [2, 1], [3, 2], [4, 7]]
p map.set(0,12)             # [[0, 12], [2, 1], [3, 2], [4, 7]]
p map.set("hello","world")  # [[0, 12], [2, 1], [3, 2], [4, 7], ["hello", "world"]]
p map.set("map","class")    # [[0, 12], [2, 1], [3, 2], [4, 7], ["hello", "world"], ["map", "class"]]
p map.set(0,"hello")        # [[0, "hello"], [2, 1], [3, 2], [4, 7], ["hello", "world"], ["map", "class"]]
map.set(15, []) 
map.show                    # [[0, "hello"], [2, 1], [3, 2], [4, 7], ["hello", "world"], ["map", "class"], [15, []]]
p map.delete("hello")       # [[0, "hello"], [2, 1], [3, 2], [4, 7], ["map", "class"], [15, []]]
p map.delete(0)             # [[2, 1], [3, 2], [4, 7], ["map", "class"], [15, []]]
p map.delete(2)             # [[3, 2], [4, 7], ["map", "class"], [15, []]]
p map.delete("hello")       # should raise RuntimeError
