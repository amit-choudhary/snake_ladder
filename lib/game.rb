require_relative './ladder'
require_relative './snake'
require_relative './dice'

class Game

  attr_reader :snakes, :ladders, :grid_length, :players, :ladders_hash, :snakes_hash

  def initialize(grid_length)
    @grid_length = grid_length
    initialize_ladders
    initialize_snakes
  end

  def start(players)
    @players = players
    puts @players
  end

  def next
    status = 0
    self.players.each do |player|
      rolled_value = 6
      while rolled_value == 6
        rolled_value = Dice.roll
        change_current_position(player, rolled_value)
      end
      if player.current_position == grid_length * grid_length
        status = 1
        break
      end
    end
    status
  end

  private

    def initialize_ladders
      @ladders = []
      @ladders_hash = {}
      grid_length.times do
        @ladders.push(Ladder.new(grid_length))
      end
      @ladders.each do |ladder|
        @ladders_hash[ladder.start_point] = ladder.end_point
      end
    end

    def initialize_snakes
      @snakes = []
      @snakes_hash = {}
      grid_length.times do
        @snakes.push(Snake.new(grid_length))
      end
      @snakes.each do |snake|
        @snakes_hash[snake.start_point] = snake.end_point
      end
    end

    def change_current_position(player, rolled_value)
      player.current_position += rolled_value if player.current_position + rolled_value <= grid_length * grid_length
      if @ladders_hash.include?(player.current_position)
        player.current_position = @ladders_hash[player.current_position]
      end
      if @snakes_hash.include?(player.current_position)
        player.current_position = @snakes_hash[player.current_position]
      end
    end

end
