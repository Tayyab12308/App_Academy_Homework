require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14, Array.new([]))  
    @cups.each_with_index do |cup, i|    
      if i == 6 || i == 13      
        @cups[i] = []      
      else      
        @cups[i] = [:stone, :stone, :stone, :stone]      
      end    
    end  
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos > @cups.length - 1 || start_pos < 0
      raise "Invalid starting cup"
    elsif @cups[start_pos] = []
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    total = @cups[start_pos].count
    @cups[start_pos] = []
    ((start_pos + 1)..(start_pos + total)).each do |i|
        new_pos = i % 13
      if current_player_name == @name1
        if new_pos == 13
          new_pos += 1
          total += 1
        else
          @cups[new_pos] << :stone 
        end
      elsif current_player_name == @name2
        if new_pos == 5
          new_pos += 1
          total += 1
        else
          @cups[new_pos] << :stone 
        end
      end
    end
    render
    next_turn(start_pos + total % 13)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    # if @cups[ending_cup_idx].empty? 
    #   return :switch
    # elsif ending_cup_idx < 6 || ending_cup_idx > 6
    #     :prompt
    # elsif !@cups[ending_cup_idx].empty?
    #   return @cups[ending_cup_idx].count
    # end
     
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |i|@cups[i].empty? } || (7..13).all? { |i|@cups[i].empty? } 
  end

  def winner
    return 
  end
end
