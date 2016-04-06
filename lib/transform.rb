require_relative 'matrix'
require_relative 'shapes'

def transform_points(transformation, points)
  points.map do |point|
    vec = Matrix.new([[point[:x]], [point[:y]]])
    new_vec = transformation*vec
    {
      :x => new_vec.values[0][0],
      :y => new_vec.values[1][0],
    }
  end
end

def transform(transformation, shapes)
  shapes.map do |shape|
    Shape.new(
      transform_points(
        transformation,
        shape.points
      ),
      shape.line_color,
      shape.fill_color
    )
  end
end

