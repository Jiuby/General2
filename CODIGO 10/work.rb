require 'mathn'

def cloud_altitude(d1, a, b)
  h = tan(b) * d1 / (tan(a) - tan(b))
  h.round
end

n = gets.to_i

heights = []
for i in 0..n-1
  d1, a, b = gets.split.map(&:to_f)
  heights.push(cloud_altitude(d1, a, b))
end

heights.each { |h| puts h }
