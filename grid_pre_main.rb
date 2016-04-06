require_relative 'shapes'
require_relative 'draw'
require_relative 'matrix'
require_relative 'transform'
require_relative 'face'

a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f
d = ARGV[3].to_f

shapes = face_shapes

(1..10).each do |i|
  shapes << Shape.new(create_line(75*i, -800, 75*i, 800), Color.new(150, 150, 150), Color.new(150, 150, 150))
  shapes << Shape.new(create_line(-75*i, -800, -75*i, 800), Color.new(150, 150, 150), Color.new(150, 150, 150))
  shapes << Shape.new(create_line(-800, 75*i, 800, 75*i), Color.new(150, 150, 150), Color.new(150, 150, 150))
  shapes << Shape.new(create_line(-800, -75*i, 800, -75*i), Color.new(150, 150, 150), Color.new(150, 150, 150))
end
shapes << Shape.new(create_line(0, -800, 0, 800), Color.new(50, 50, 50), Color.new(50, 50, 50))
shapes << Shape.new(create_line(-800, 0, 800, 0), Color.new(50, 50, 50), Color.new(50, 50, 50))

transformed_shapes = transform(Matrix.new([[a, b],
                                           [c, d]]),
                               shapes)

draw(transformed_shapes, "results/grid_pre_smile_#{a}_#{b}_#{c}_#{d}.png")
