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
