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

def caesar(letter, shift)
  alphabet = ('a'..'z').to_a
  if letter == '-'
    return ' '
  end

  idx = alphabet.index(letter)
  shifted_idx = (idx + shift) % 26
  alphabet[shifted_idx]
end

def security2(code)
  lb = code.index('[')
  last_dash = code.rindex('-')
  encrypted = code[0...last_dash]
  room_num = code[last_dash + 1 ... lb].to_i

  decrypted = ''
  encrypted.chars do |letter|
    decrypted += caesar(letter, room_num)
  end
  [decrypted, room_num]
end

def read_security2(file)
  codes = File.readlines(file)
  codes.each do |code|
    secret = security2(code)
    return secret[1] if secret[0].include?('north')
  end
end
# aaaaa-bbb-z-y-x-123[abxyz]
puts read_security2('security.txt')
