****************
*XXXXXXXXX* XXE*
*X   *   X* X***
*X   *   X* X  *
*X   *   X* X  *
*X   *   X* X  *
*S   *   XXXX  *
****************

starting_point = "S"
end_point = "E"
snake_body = "X"

play_field = Array.new(8){ Array.new(16, " ") }

play_field.each do |el|
    el = "*"
end

puts play_field