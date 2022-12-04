require 'csv'

PLAYER_SHAPES = {
  "X" => "A",
  "Y" => "B",
  "Z" => "C"
}

SHAPE_POINTS = {
  "A" => 1,
  "B" => 2,
  "C" => 3
}

RESULT_POINTS = {
  loss: 0,
  draw: 3,
  win: 6
}

OUTCOMES = {
  "A" => {"A" => :draw, "B" => :loss, "C" => :win},
  "B" => {"A" => :win, "B" => :draw, "C" => :loss},
  "C" => {"A" => :loss, "B" => :win, "C" => :draw}
}

DESIRED_OUTCOME_FOR_OPP = {
  "X" => :win,
  "Y" => :draw,
  "Z" => :loss
}

class Strategy
  attr_reader :points

  def initialize(games)
    @games = games
    @points = 0
  end

  def parse_p1
    @games.each do |game|
      player_shape, opponent_shape = PLAYER_SHAPES[game[1]], game[0]
      post_result(player_shape, opponent_shape)
    end
  end

  def parse_p2
    @games.each do |game|
      opponent_shape = game[0]
      player_shape = OUTCOMES[opponent_shape].key(DESIRED_OUTCOME_FOR_OPP[game[1]])
      post_result(player_shape, opponent_shape)
    end
  end

  def post_result(player, opp)
    result = OUTCOMES[player][opp]
    @points += RESULT_POINTS[result] + SHAPE_POINTS[player]
  end
end

games = CSV.read(ARGV[0], col_sep: ' ')

# Part 1
strategy_p1 = Strategy.new(games)
strategy_p1.parse_p1

puts "What would your total score be if everything goes exactly according to your strategy guide?"
puts strategy_p1.points

# Part 2
strategy_p2 = Strategy.new(games)
strategy_p2.parse_p2

puts "Following the Elf's instructions for the second column, what would your total score be if everything goes exactly according to your strategy guide?"
puts strategy_p2.points
