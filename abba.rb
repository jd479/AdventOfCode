require 'byebug'
def is_abba?(string)
  if string[0] == string[3] && string[1] == string[2]
    if string[0] == string[1]
      return false
    end
    return true
  end
  false
end

def is_between_bracket?(substring, string)
  left_brackets = (0 ... string.length).find_all { |idx| string[idx, 1] == '['}
  right_brackets = (0 ... string.length).find_all { |idx| string[idx, 1] == ']'}
  sub_idx = string.index(substring)
  i = 0
  while i < left_brackets.length
    return true if sub_idx > left_brackets[i] && sub_idx < right_brackets[i]
    i += 1
  end
  false
end

def ip_supported(string)
  i = 0
  while i < string.length - 3
    substring = string[i .. i + 3]
    if is_abba?(substring)
      return false if is_between_bracket?(substring, string)
    end
    i += 1
  end
  i = 0
  while i < string.length - 3
    substring = string[i .. i + 3]
    if is_abba?(substring)
      return false if is_between_bracket?(substring, string)
      return true
    end
    i += 1
  end
  false
end

def read_ip(file)
  ip_list = File.readlines(file)
  count = 0
  ip_list.each do |ip|
    ip = ip[0...-1]
    count += 1 if ip_supported(ip)
  end
  count
end

p read_ip('abba.txt')

# p ip_supported('abba[mnop]qrst')
# p ip_supported('abcd[bddb]xyyx')
# p ip_supported('aaaa[qwer]tyui')
# p ip_supported('ioxxoj[asdfgh]zxcvbn')
