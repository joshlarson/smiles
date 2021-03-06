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

def create_line(x_1, y_1, x_2, y_2)
  [
    {:x => x_1, :y => y_1},
    {:x => x_2, :y => y_2},
    {:x => x_1, :y => y_1},
  ]
end

def interpolate(shape)
  cycled = shape + [shape[0]]
  result = []
  (0..shape.size-1).each do |i|
    to = cycled[i+1]
    from = cycled[i]
    (0..100).each do |factor|
      result << {
        :x => to[:x]*(factor/100.0) + from[:x]*(1 - factor/100.0),
        :y => to[:y]*(factor/100.0) + from[:y]*(1 - factor/100.0),
      }
    end
  end
  result
end
