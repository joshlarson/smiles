require_relative 'shapes'
require_relative 'draw'
require_relative 'matrix'
require_relative 'transform'
require_relative 'face'

shapes = face_shapes

(1..10).each do |i|
  shapes << Shape.new(create_line(100*i, 1000, -1000, -100*i), Color.new(150, 150, 150), Color.new(150, 150, 150))
  shapes << Shape.new(create_line(-100*i, -1000, 1000, 100*i), Color.new(150, 150, 150), Color.new(150, 150, 150))
  shapes << Shape.new(create_line(100*i, -1000, -1000, 100*i), Color.new(150, 150, 150), Color.new(150, 150, 150))
  shapes << Shape.new(create_line(-100*i, 1000, 1000, -100*i), Color.new(150, 150, 150), Color.new(150, 150, 150))
end
shapes << Shape.new(create_line(-1000, -1000, 1000, 1000), Color.new(50, 50, 50), Color.new(50, 50, 50))
shapes << Shape.new(create_line(-1000, 1000, 1000, -1000), Color.new(50, 50, 50), Color.new(50, 50, 50))

transformed_shapes = shapes.map do |shape|
  points = interpolate(shape.points).map do |point|
    x = point[:x]
    y = point[:y]
    {
      :x => point[:x],
      :y => point[:y]*(300.0 - point[:x])/300.0,
    }
  end
  Shape.new(points, shape.line_color, shape.fill_color)
end

draw(transformed_shapes, "results/diag_grid_pre_curved_smile.png")
