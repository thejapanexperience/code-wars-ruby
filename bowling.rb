puts "What is your name?"
name = gets.chomp
frameOutcome = ["start"]

# puts "What is your score?"
# scr = gets.chomp.to_i
# puts scr

frames = 0
score = [0]
totalScore = 0
actualScore = ["start"]
frameScores = ["start", {one: 7, two:0}, {one: 0, two:0}, {one: 0, two:0}, {one: 0, two:0}, {one: 0, two:0}, {one: 0, two:0}, {one: 0, two:0}, {one: 0, two:0}, {one: 0, two:0}, {one: 0, two:0, three: 0}]

while frames <= 10 do

  actualScore = ["start"]
  index = 1
  puts "Calculating Frame Scores:"

  while index <=  do
    # DOUBLE OR STRIKE
    if frameScores[index][:one] == 10 && frameScores[index + 1][:one] == 10
      puts "double"
      actualScore << (20 + frameScores[index + 2][:one]) unless index > 8
      if index == 9
        actualScore << ()
    elsif frameScores[index][:one] == 10 && frameScores[index + 1][:one] < 10
      puts "strike"
      actualScore << (10 + frameScores[index + 1][:one] + frameScores[index + 1][:two]) unless index > 9
    end

    # SPARE
    if frameScores[index][:one] < 10 && (frameScores[index][:one] + frameScores[index][:two] == 10)
      puts "spare"
      actualScore << (10 + frameScores[index+1][:one])
    end

    # OPEN
    if frameScores[index][:one] + frameScores[index][:two] < 10
      puts "open"
      actualScore << (frameScores[index][:one] + frameScores[index][:two])
    end
    index += 1
  end

  while index == 9 do
    # DOUBLE OR STRIKE
    if frameScores[index][:one] == 10 && frameScores[index + 1][:one] == 10
      puts "double"
      actualScore << (20 + frameScores[index + 2][:one])
    elsif frameScores[index][:one] == 10 && frameScores[index + 1][:one] < 10
      puts "strike"
      actualScore << (10 + frameScores[index + 1][:one] + frameScores[index + 1][:two])
    end

    # SPARE
    if frameScores[index][:one] < 10 && (frameScores[index][:one] + frameScores[index][:two] == 10)
      puts "spare"
      actualScore << (10 + frameScores[index+1][:one])
    end

    # OPEN
    if frameScores[index][:one] + frameScores[index][:two] < 10
      puts "open"
      actualScore << (frameScores[index][:one] + frameScores[index][:two])
    end
    index += 1
  end

  print "actualScore : #{actualScore}"
  puts " "

  puts "Frame #{frames + 1}. Your score is currently #{score.last}."
  puts "your last frame was #{frameOutcome.last}." unless frameOutcome.size == 0
  puts "how many pins did you knock down?"
  scor1 = gets.chomp.to_i

  while scor1 > 10
    puts "nope! must be 10 or less"
    scor1 = gets.chomp.to_i
  end


  # STRIKE
  if scor1 == 10
    frameScores[frames+1] = {one: 10, two: 0}
    if frameOutcome.last == "double"
      if frameOutcome[frames-3] && (frameOutcome[frames-3] == "double" || frameOutcome[frames-3] == "strike")
        score << (score.last + 30)
      end
      frameOutcome << "double"
    end
    if frameOutcome.last == "strike"
      frameOutcome << "double"
      score << score.last
    end
    if frameOutcome.last != "double" && frameOutcome.last != "strike"
      frameOutcome << "strike"
      score << score.last
    end
  end

  if scor1 < 10
    puts "try again. How many this time?"
    scor2 = gets.chomp.to_i
    while scor1 + scor2 > 10
      puts "nope! your max score is #{10 - scor1}. Be honest!"
      scor2 = gets.chomp.to_i
    end

    # SPARE
    if scor1 < 10 && scor1 + scor2 == 10
      # if frameOutcome.last == "open"
      #   score << (score.last + scor1 + scor2)
      # end
      if frameOutcome.last == "spare"
        score << (score.last + 10 + scor1)
      end
      if frameOutcome.last == "strike"
        score << (score.last + scor1 + 10)
      end
      if frameOutcome.last == "double"
        score << (score.last + 20 + scor1 + scor2)
      end
      frameOutcome << "spare"
      score << score.last
    end

    # OPEN
    if scor1 + scor2 < 10
      if frameOutcome.last == "open"
        score << (score.last + scor1 + scor2)
      end
      if frameOutcome.last == "spare"
        score << (score.last + 10 + scor1)
      end
      if frameOutcome.last == "strike"
        score << (score.last + scor1 + 10)
      end
      if frameOutcome.last == "double"
        score << (score.last + 20 + scor1 + scor2)
      end
      score << (score.last + scor1 + scor2)
      frameOutcome << "open"
    end
    frameScores[frames+1] = {one: scor1, two: scor2}
  end

  frames += 1
  # print frameOutcome
  # puts " "
  # print frameScores
  # puts " "
  # print score
  # puts " "
end

# if frames == 10
#   puts "Frame 10! Your score is currently #{score.last}."
#   puts "your last frame was #{frameOutcome.last}."
#   puts "how many pins did you knock down?"
#   scor1 = gets.chomp.to_i
#   if scor1 == 10
#
# end


puts "#{name}'s final score is: #{score.last}"
