require_relative 'shapes'
require_relative 'draw'
require_relative 'matrix'
require_relative 'transform'
require_relative 'face'


transformed_shapes = face_shapes.map do |shape|
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

draw(transformed_shapes, "results/curved_smile.png")
