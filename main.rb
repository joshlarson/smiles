require_relative 'shapes'
require_relative 'smile'

draw_face(create_circle(300, 300, 125),
          create_circle(250, 250, 20),
          create_circle(350, 250, 20),
          create_arc(300, 300, 100, 0.05, 0.45))
