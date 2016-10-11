class Turn
  def initialize(i, num_of_player)
    @i = i
    @num = num_of_player
  end

  def decide_turn
    [*1..@num][@i % @num]
  end

end
