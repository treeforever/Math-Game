class Question
  def random_num
    num = Random.new
    num.rand(0..20)
  end

  def pop_question
    num1 = random_num
    num2 = random_num
    answer = num1 + num2
    return["What does #{num1} plus #{num2} equal?",answer.to_s]
  end
end
