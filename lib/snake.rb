class Snake

  attr_accessor :start_point, :end_point

  def initialize(grid_length)
    generate_points(grid_length)
  end

  def generate_points(grid_length)
    start_grid_point = rand(2..grid_length)
    end_grid_point = rand(1..(start_grid_point - 1))
    self.start_point = generate_point(start_grid_point, grid_length)
    while start_point == grid_length * grid_length
      self.start_point = generate_point(start_grid_point, grid_length)
    end
    self.end_point = generate_point(end_grid_point, grid_length)
  end

  def generate_point(grid_point, grid_length)
    grid_point * grid_length + rand(0..grid_length)
  end

end
