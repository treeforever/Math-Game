require "./Question"
require "./Player"
require "./Turn"

# module MathGame = {
#
# }

class Game
  def initialize(num_of_player)
    @num = num_of_player

    @players = @num.times.map { |i| Player.new }
    @current_player_index
  end

  def next_turn
    @current_player_index = (@current_player_index + 1) % @size
  end

  def ask_question(player_num)
    question = Question.new
    q_and_a = question.pop_question

    puts "Player #{player_num}: #{q_and_a[0]}"
    user_input = gets.chomp
    if_correct = (user_input == q_and_a[1])
    @players[player_num - 1].score = @players[player_num - 1].score_eveluate(@players[player_num - 1].score, if_correct)
    if_correct
  end

  # def customized_scores(players)
  #   if players.length
  #   players.each { |p| puts }

  def alive? (player)
    if player.score == Rational('0/1')
      puts "Player ?? wins with a score of #{@players[??].score}"
      puts "------------- Game Over --------------"
      exit
  end

  def game_feedback(if_correct, player_num)
    if if_correct
      puts "Congrats!"
    elsif @players[0].score == Rational('0/1')
      puts "Player 2 wins with a score of #{@players[1].score}"
      puts "------------- Game Over --------------"
      exit
    elsif @players[1].score == Rational('0/1')
      puts "Player 1 wins with a score of #{@players[0].score}"
      puts "------------- Game Over --------------"
      exit
    else
      puts "Player #{player_num}: Seriously? Are you hang over?"
      puts "P1: #{@players[0].score} vs P2: #{@players[1].score}"
    end

    puts "------------- New Turn --------------"
  end

  def start_game
    while(@players.count { |p| p.score > 0} > 1)
      which_player = decide_turn(i, @num)
      boolean_value = ask_question(which_player)
      game_feedback(boolean_value, which_player)
      i += 1
    end

    
  end

end

game = Game.new(3)
game.start_game
