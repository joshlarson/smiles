require_relative 'shapes'
require_relative 'draw'
require_relative 'matrix'
require_relative 'transform'
require_relative 'face'

a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f
d = ARGV[3].to_f

x = ARGV[4].to_f
y = ARGV[5].to_f

shapes = face_shapes + [
  Shape.new(create_circle(x*75, y*75, 10), Color.new(0, 0, 0), Color.new(255, 0, 0))
]

transformed_shapes = transform(Matrix.new([[a, b],
                                           [c, d]]),
                               shapes)

draw(transformed_shapes, "results/dot_smile_#{a}_#{b}_#{c}_#{d}_#{x}_#{y}.png")
