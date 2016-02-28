require 'chunky_png'

def draw_face(face, left_eye, right_eye, mouth)
  canvas = ChunkyPNG::Canvas.new(600, 600, ChunkyPNG::Color.rgb(200, 200, 255))

  canvas.polygon(face, ChunkyPNG::Color::BLACK, ChunkyPNG::Color.rgb(255, 255, 0))
  canvas.polygon(left_eye, ChunkyPNG::Color::BLACK, ChunkyPNG::Color::BLACK)
  canvas.polygon(right_eye, ChunkyPNG::Color::BLACK, ChunkyPNG::Color::BLACK)
  canvas.polygon(mouth, ChunkyPNG::Color::BLACK, ChunkyPNG::Color::BLACK)

  canvas.save('smile.png')
end
