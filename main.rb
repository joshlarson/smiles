require_relative 'shapes'
require_relative 'draw'
require_relative 'matrix'

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

hat = [{:x => 0, :y => 100}, {:x => 150, :y => 150}, {:x => 100, :y => 0}]
face = create_circle(0, 0, 125)
left_eye = create_circle(-50, 50, 20)
right_eye = create_circle(50, 50, 20)
mouth = create_arc(0, 0, 100, 0.55, 0.95)

shapes = [
  Shape.new(hat, Color.new(0, 0, 0), Color.new(255, 0, 0)),
  Shape.new(face, Color.new(0, 0, 0), Color.new(255, 255, 0)),
  Shape.new(left_eye, Color.new(0, 0, 0), Color.new(0, 0, 0)),
  Shape.new(right_eye, Color.new(0, 0, 0), Color.new(0, 0, 0)),
  Shape.new(mouth, Color.new(0, 0, 0), Color.new(0, 0, 0)),
]

a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f
d = ARGV[3].to_f

transformed_shapes = transform(Matrix.new([[a, b],
                                           [c, d]]),
                               shapes)

draw(transformed_shapes, "smile_#{a}_#{b}_#{c}_#{d}.png")
