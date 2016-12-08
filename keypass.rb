require 'byebug'

def key_finder(instructions, position = [2, 0])
  # keypad = [
  #   [1, 2, 3],
  #   [4, 5, 6],
  #   [7, 8, 9]
  # ]

  keypad = [
    [nil, nil, 1, nil, nil],
    [nil, 2, 3, 4, nil],
    [5, 6, 7, 8, 9],
    [nil, 'A', 'B', 'C', nil],
    [nil, nil, 'D', nil, nil]
  ]

  i = 0

  while i < instructions.length
    case instructions[i]
    when 'L'
      position[1] -= 1 if position[1] > 0 && keypad[position[0]][position[1] - 1]
    when 'R'
      position[1] += 1 if position[1] < 4 && keypad[position[0]][position[1] + 1]
    when 'U'
      position[0] -= 1 if position[0] > 0 && keypad[position[0] - 1][position[1]]
    when 'D'
      # debugger
      position[0] += 1 if position[0] < 4 && keypad[position[0] + 1][position[1]]
    end
    i += 1
  end
  # debugger
  number = keypad[position[0]][position[1]]
  # {number: number, position: position}
  [number, position]
end

def read_instructions(file)
  instructions = File.readlines(file)
  code = []
  start = [2, 0]
  instructions.each do |info|
    result = key_finder(info, start)
    
    code << result[0]
    start = result[1]
  end
  p code
end

read_instructions('keypass_instructions.txt')
