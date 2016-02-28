require 'chunky_png'

def create_circle(center_x, center_y, radius)
  points = []
  samples = 100

  (0..samples).each do |i|
    angle = 2*Math::PI*i/samples
    x = (center_x + radius*Math::cos(angle)).to_i
    y = (center_y + radius*Math::sin(angle)).to_i

    points << {:x => x, :y => y}
  end
  points
end

def create_arc(center_x, center_y, radius, start_angle, end_angle)
  points = []
  samples = 100

  ((samples*start_angle).to_i..(samples*end_angle).to_i).each do |i|
    angle = 2*Math::PI*i/samples
    x = (center_x + radius*Math::cos(angle)).to_i
    y = (center_y + radius*Math::sin(angle)).to_i

    points << {:x => x, :y => y}
  end
  points
end

def draw_face(face, left_eye, right_eye, mouth)
  canvas = ChunkyPNG::Canvas.new(600, 600, ChunkyPNG::Color.rgb(200, 200, 255))

  canvas.polygon(face, ChunkyPNG::Color::BLACK, ChunkyPNG::Color.rgb(255, 255, 0))
  canvas.polygon(left_eye, ChunkyPNG::Color::BLACK, ChunkyPNG::Color::BLACK)
  canvas.polygon(right_eye, ChunkyPNG::Color::BLACK, ChunkyPNG::Color::BLACK)
  canvas.polygon(mouth, ChunkyPNG::Color::BLACK, ChunkyPNG::Color::BLACK)

  canvas.save('smile.png')
end

draw_face(create_circle(300, 300, 125),
          create_circle(250, 250, 20),
          create_circle(350, 250, 20),
          create_arc(300, 300, 100, 0.05, 0.45))
