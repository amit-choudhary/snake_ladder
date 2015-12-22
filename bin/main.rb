require_relative '../lib/player'
require_relative '../lib/game'

puts '*******Starting the game**********'

game = Game.new(10)
first_player = Player.new('Amit')
second_player = Player.new('Shruti')
third_player = Player.new('Shiksha')

players_array = [first_player, second_player, third_player]
game.start(players_array)

while game.next != 1
  puts '********rolling the dice for each player*******'
  puts players_array
end

puts '*********End of the game********'
puts players_array
