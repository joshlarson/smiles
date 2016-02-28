require_relative 'shapes'
require_relative 'draw'

face = create_circle(300, 300, 125)
left_eye = create_circle(250, 250, 20)
right_eye = create_circle(350, 250, 20)
mouth = create_arc(300, 300, 100, 0.05, 0.45)

shapes = [
  Shape.new(face, Color.new(0, 0, 0), Color.new(255, 255, 0)),
  Shape.new(left_eye, Color.new(0, 0, 0), Color.new(0, 0, 0)),
  Shape.new(right_eye, Color.new(0, 0, 0), Color.new(0, 0, 0)),
  Shape.new(mouth, Color.new(0, 0, 0), Color.new(0, 0, 0)),
]

draw(shapes)
