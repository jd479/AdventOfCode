require 'byebug'

def security(code)
  data = code.split('-')
  lb = data.last.index('[')
  room_num = data.last[0..2]
  checksum = data.last[lb + 1 ... -2]
  letters = ('a'..'z').to_a
  letter_count = Hash.new(0)

  i = 0
  while i < code.rindex('-')
    letter = code[i]
    letter_count[letter] += 1
    i += 1
  end

  letter_count.delete('-')
  letter_count
  counts = letter_count.sort { |(k1, v1), (k2, v2)| [v1, k2] <=> [v2, k1] }
  secret = ""
  while secret.length < 5
    combo = counts.pop
    secret += combo[0]
  end
  [room_num.to_i, secret == checksum]
end

def read_security(file)
  codes = File.readlines(file)
  sum = 0
  codes.each do |code|
    if security(code)[1]
      sum += security(code)[0]
    end
  end
  sum
end

p read_security('security.txt')
