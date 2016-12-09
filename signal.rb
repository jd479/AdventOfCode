def signal(file)
  corrupted = File.readlines(file)
  line_length = corrupted[0].length
  idx = 0
  code = ''
  while idx < line_length
    letter_count = Hash.new(0)
    line_num = 0
    while line_num < corrupted.length
      letter = corrupted[line_num][idx]
      letter_count[letter] += 1
      line_num += 1
    end
    largest_pair = letter_count.min_by { |letter, count| count}
    code += largest_pair[0]
    idx += 1
  end
  code
end

p signal('signal.txt')
