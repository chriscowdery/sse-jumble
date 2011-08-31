class Array
  def shuffle!
    size.downto(1) { |n| push delete_at(rand(n)) }
    self
  end
end

FUDGE_FACTOR = 1

def get_letter_array(person_count)
  letter_freqs = []
  letter_freqs << ['e', 12]
  letter_freqs << ['a', 9]
  letter_freqs << ['i', 9]
  letter_freqs << ['o', 8]
  letter_freqs << ['n', 6]
  letter_freqs << ['r', 6]
  letter_freqs << ['t', 6]
  letter_freqs << ['l', 4]
  letter_freqs << ['s', 4]
  letter_freqs << ['u', 4]
  letter_freqs << ['d', 4]
  letter_freqs << ['g', 3]
  letter_freqs << ['b', 2]
  letter_freqs << ['c', 2]
  letter_freqs << ['m', 2]
  letter_freqs << ['p', 2]
  letter_freqs << ['f', 2]
  letter_freqs << ['h', 2]
  letter_freqs << ['v', 2]
  letter_freqs << ['w', 2]
  letter_freqs << ['y', 2]
  letter_freqs << ['k', 1]
  letter_freqs << ['j', 1]
  letter_freqs << ['x', 1]
  letter_freqs << ['q', 1]
  letter_freqs << ['z', 1]

  scrabble_count = 100

  letter_array = []

  letter_freqs.each do |i|
    letter = i[0] 
    scrabble_freq = i[1]
    person_freq = scrabble_freq.to_f * (person_count.to_f / scrabble_count) * FUDGE_FACTOR
    person_freq = person_freq.round
    person_freq = 1 if person_freq == 0

    (1..person_freq).each do
      letter_array << letter
      break if letter_array.size == person_count
    end

    break if letter_array.size == person_count
  end

  letter_array.shuffle!
end

def letter_score(letter)
  case letter
  when 'e', 'a', 'i', 'o', 'n', 'r', 't', 'l', 's', 'u'
    1
  when 'd', 'g'
    2
  when 'b', 'c', 'm', 'p'
    3
  when 'f', 'h', 'v', 'w', 'y'
    4
  when 'k'
    5
  when 'j', 'x'
    8
  when 'q', 'z'
    10
  end
end

def simple_info()
  require 'pp'
  a = get_letter_array(80)

  ("a".."z").each do |i|
    puts i + ": " + a.count(i).to_s
  end

  puts a.size

  num = 0
  tot_score = 0
  words = File.new("../words.txt")

  words.each do |line|
    line.strip!
    line.downcase!

    word = line
    line = line.split(//)
    good = true
    score = 0

    ("a".."z").each do |i|
      if a.count(i) < line.count(i)
        good = false
        break
      else
        score += (letter_score(i) * line.count(i))
      end
    end

    tot_score += score if good
    num += 1 if good
    puts word + ": " + score.to_s if good
  end

  puts "Total Words: "  + num.to_s
  puts "Total Score: "  + tot_score.to_s
end

