class Player

  attr_accessor :current_position
  attr_reader :name

  def initialize(name)
    @name = name
    @current_position = 0
  end

  def to_s
    "#{ name } Current Position: #{ current_position }"
  end

end
