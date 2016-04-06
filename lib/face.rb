require_relative 'shapes'

def face_shapes
  hat = [
    {:x => -30, :y => 120},
    {:x => -20, :y => 150},

    {:x => 7, :y => 141},
    {:x => 27, :y => 201},
    {:x => 108, :y => 174},
    {:x => 88, :y => 114},

    {:x => 115, :y => 105},
    {:x => 105, :y => 75},
  ]
  face = create_circle(0, 0, 125)
  left_eye = create_circle(-50, 50, 20)
  right_eye = create_circle(50, 50, 20)
  mouth = create_arc(0, 0, 100, 0.55, 0.95)

  shapes = [
    Shape.new(face, Color.new(0, 0, 0), Color.new(255, 255, 0)),
    Shape.new(left_eye, Color.new(0, 0, 0), Color.new(0, 0, 0)),
    Shape.new(right_eye, Color.new(0, 0, 0), Color.new(0, 0, 0)),
    Shape.new(mouth, Color.new(0, 0, 0), Color.new(0, 0, 0)),
    Shape.new(hat, Color.new(0, 0, 0), Color.new(0, 0, 0)),
  ]
end
