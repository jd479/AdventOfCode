require 'byebug'

def key_finder(instructions, position = [1, 1])
  keypad = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]

 # [1, 1] for first num
  i = 0

  while i < instructions.length
    # debugger
    case instructions[i]
    when 'L'
      position[1] -= 1 if position[1] > 0
    when 'R'
      position[1] += 1 if position[1] < 2
    when 'U'
      position[0] -= 1 if position[0] > 0
    when 'D'
      position[0] += 1 if position[0] < 2
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
  start = [1, 1]
  instructions.each do |info|
    result = key_finder(info, start)
    # debugger
    code << result[0]
    start = result[1]
  end
  p code
end

read_instructions('keypass_instructions.txt')
