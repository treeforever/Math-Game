class Player
  attr_accessor :score

  def initialize(score)
    @score = score
  end

  def score_eveluate(score, correct)
    if correct
      score
    else
      score = Rational(score) - Rational('1/3')
    end
    
  end
end
