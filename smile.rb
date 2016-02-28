require 'chunky_png'

class Color
  attr_accessor :red, :green, :blue

  def initialize(red, green, blue)
    @red = red
    @green = green
    @blue = blue
  end
end

class Shape
  attr_accessor :points, :line_color, :fill_color

  def initialize(points, line_color, fill_color)
    @points = points
    @line_color = line_color
    @fill_color = fill_color
  end
end

def chunky_color(color)
  ChunkyPNG::Color.rgb(color.red, color.green, color.blue)
end

def draw_face(shapes)
  canvas = ChunkyPNG::Canvas.new(600, 600, ChunkyPNG::Color.rgb(200, 200, 255))

  shapes.each do |shape|
    canvas.polygon(shape.points, chunky_color(shape.line_color), chunky_color(shape.fill_color))
  end

  canvas.save('smile.png')
end
