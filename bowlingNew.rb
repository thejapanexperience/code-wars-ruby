frames = [
  { one: 10, two: 0 },
  { one: 10, two: 0 },
  { one: 10, two: 0 },
  { one: 10, two: 0 },
  { one: 10, two: 0 },
  { one: 7, two: 0 },
  { one: 7, two: 0 },
  { one: 7, two: 0 },
  { one: 10, two: 0 },
  { one: 7, two: 3, three: 8 }
]

puts "what's your name?"
name = gets.chomp

frame = 1

while frame < 11
  puts "This is frame #{frame}"
  puts "Roll! What did you get?"
  one = gets.chomp.to_i
  while one > 10
    puts "Nope! Try again."
    one = gets.chomp.to_i
  end
  case frame
  when 10
    puts "Roll again. What did you get?"
    two = gets.chomp.to_i
    while one == 10 && two > 10
      puts "Nope! Liar liar."
      two = gets.chomp.to_i
    end
    while one < 10 && (one + two > 10)
      puts "Nope! Liar liar."
      two = gets.chomp.to_i
    end
    three = 0
    puts "Roll again. Last shot! What did you get?"
    three = gets.chomp.to_i
    while ((one + two) % 10 == 0) && three > 10
        puts "Liar!"
        three = gets.chomp.to_i
    end
    while one == 10 && two < 10 && (two + three > 10)
      puts "Liar!"
      three = gets.chomp.to_i
    end
    frames[frame-1] = {one: one, two: two, three: three}
  when 1..9
    if one == 10
      frames[frame-1] = {one: 10, two: 0}
    else
      puts "Roll again. What did you get?"
      two = gets.chomp.to_i
      while (two + one) > 10
        puts "Nope! Try again."
        two = gets.chomp.to_i
      end
      frames[frame-1] = {one: one, two: two}
    end
  else
    puts "error"
  end
  frame += 1
end

frame_scores = frames.map.with_index do |e, i|

  case i

  when 0..7
    if e[:one] == 10 && frames[i + 1][:one] == 10
      20 + frames[i + 2][:one]
    elsif e[:one] == 10 && frames[i + 1][:one] < 10
      10 + frames[i + 1][:one] + frames[i + 1][:two]
    elsif e[:one] < 10 && (e[:one] + e[:two] == 10)
      10 + frames[i + 1][:one]
    else
      e[:one] + e[:two]
    end

  when 8
    if e[:one] == 10 && frames[i + 1][:one] == 10
      20 + frames[i + 1][:three]
    elsif e[:one] == 10 && frames[i + 1][:one] < 10
      10 + frames[i + 1][:one] + frames[i + 1][:two]
    elsif e[:one] < 10 && (e[:one] + e[:two] == 10)
      10 + frames[i + 1][:one]
    else
      e[:one] + e[:two]
    end

  when 9
    if e[:one] == 10 && e[:two] == 10
      20 + e[:three]
    elsif e[:one] == 10 && e[:two] < 10
      10 + e[:two] + e[:three]
    else
      e[:one] + e[:two] + e[:three]
    end
  else
    puts "error"
  end
end

print frame_scores
puts ''

puts "#{name}'s total score: #{frame_scores.reduce(0, :+)}"
