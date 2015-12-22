class Ladder

  attr_accessor :start_point, :end_point

  def initialize(grid_length)
    generate_points(grid_length)
  end

  private

    def generate_points(grid_length)
      start_grid_point = rand(1..(grid_length - 2))
      end_grid_point = rand((start_grid_point + 1)..(grid_length - 1))
      self.start_point = generate_point(start_grid_point, grid_length)
      self.end_point = generate_point(end_grid_point, grid_length)
      while self.end_point > grid_length * grid_length
        self.end_point = generate_point(end_grid_point, grid_length)
      end
    end

    def generate_point(grid_point, grid_length)
      grid_point * grid_length + rand(0..grid_length)
    end

end
