def distance
  path = 'R1, L4, L5, L5, R2, R2, L1, L1, R2, L3, R4, R3, R2, L4, L2, R5, L1, R5, L5, L2, L3, L1, R1, R4, R5, L3, R2, L4, L5, R1, R2, L3, R3, L3, L1, L2, R5, R4, R5, L5, R1, L190, L3, L3, R3, R4, R47, L3, R5, R79, R5, R3, R1, L4, L3, L2, R194, L2, R1, L2, L2, R4, L5, L5, R1, R1, L1, L3, L2, R5, L3, L3, R4, R1, R5, L4, R3, R1, L1, L2, R4, R1, L2, R4, R4, L5, R3, L5, L3, R1, R1, L3, L1, L1, L3, L4, L1, L2, R1, L5, L3, R2, L5, L3, R5, R3, L4, L2, R2, R4, R4, L4, R5, L1, L3, R3, R4, R4, L5, R4, R2, L3, R4, R2, R1, R2, L4, L2, R2, L5, L5, L3, R5, L5, L1, R4, L1, R1, L1, R4, L5, L3, R4, R1, L3, R4, R1, L3, L1, R1, R2, L4, L2, R1, L5, L4, L5'
  path = path.split(', ')

  directions = ['N', 'E', 'S', 'W']

  x_distance = 0
  y_distance = 0

  visited = []

  current_direction = 0
  count = 0
  path.each do |turn|
    length = turn[1].to_i
    dir = turn[0]
    count += 1
    current_direction = change_directions(dir, current_direction)

    case directions[current_direction]
    when 'N'
      y_distance += length
    when 'E'
      x_distance += length
    when 'S'
      y_distance -= length
    when 'W'
      x_distance -= length
    end
    puts "#{count}: #{[x_distance, y_distance]}"
    if visited.include?([x_distance, y_distance])
      return x_distance.abs + y_distance.abs
    else
      visited << [x_distance, y_distance]
    end
  end


end

def change_directions(str, current_dir)
  if str == 'R'
    current_dir = (current_dir + 1) % 4
  elsif str == 'L'
    if current_dir == 0
      current_dir = 3
    else
      current_dir -= 1
    end
  end
  current_dir
end

print distance
