require 'byebug'

def is_triangle?(sides)
  return false if sides[0] + sides[1] <= sides[2]
  return false if sides[0] + sides[2] <= sides[1]
  return false if sides[2] + sides[1] <= sides[0]
  true
end

def read_triangles(file)
  triangles = File.readlines(file)
  count = 0
  i = 0
  while i < triangles.length
    j = 0
    while j < 14
      side1 = triangles[i][j.. j+2 ].to_i
      side2 = triangles[i + 1][j.. j+2 ].to_i
      side3 = triangles[i + 2][j.. j+2 ].to_i
      sides = [side1, side2, side3]
      # debugger
      count += 1 if is_triangle?(sides)
      j += 5
    end

    i += 3
  end
  count
end

p read_triangles('triangles.txt')
