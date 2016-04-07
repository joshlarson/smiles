require 'chunky_png'

def chunky_color(color)
  ChunkyPNG::Color.rgb(color.red, color.green, color.blue)
end

def chunky_points(points)
  points.map do |point|
    {
      :x => 300 + point[:x],
      :y => 300 - point[:y],
    }
  end
end

def draw(shapes, file_name)
  canvas = ChunkyPNG::Canvas.new(600, 600, ChunkyPNG::Color.rgb(200, 200, 255))

  shapes.each do |shape|
    canvas.polygon(
      chunky_points(shape.points),
      chunky_color(shape.line_color),
      chunky_color(shape.fill_color)
    )
  end

  canvas.save(file_name)
  puts "Wrote file to #{file_name}"
end
