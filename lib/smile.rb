require_relative 'shapes'
require_relative 'draw'
require_relative 'matrix'
require_relative 'transform'
require_relative 'face'

a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f
d = ARGV[3].to_f

transformed_shapes = transform(Matrix.new([[a, b],
                                           [c, d]]),
                               face_shapes)

draw(transformed_shapes, "results/smile_#{a}_#{b}_#{c}_#{d}.png")
