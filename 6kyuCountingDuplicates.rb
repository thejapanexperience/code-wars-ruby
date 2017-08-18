
def duplicate_count(text)
  arr = text.downcase.split('')
  dupe_arr = []
  index = 0
  arr.each do |char|
    arr[index] = nil
    dupe_arr << char.downcase unless dupe_arr.include?(char) || !arr.include?(char)
    index += 1
  end
  puts dupe_arr.length
  dupe_arr.length
end

puts 'test'
puts 'githubtest'

duplicate_count('aabbBcdefg')
