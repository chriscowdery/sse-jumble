class Array
  def shuffle!
    size.downto(1) { |n| push delete_at(rand(n)) }
    self
  end
end

FUDGE_FACTOR = 1

def get_letter_array(person_count)
  letter_freqs = []
  letter_freqs << ['E', 12]
  letter_freqs << ['A', 9]
  letter_freqs << ['I', 9]
  letter_freqs << ['O', 8]
  letter_freqs << ['N', 6]
  letter_freqs << ['R', 6]
  letter_freqs << ['T', 6]
  letter_freqs << ['L', 4]
  letter_freqs << ['S', 4]
  letter_freqs << ['U', 4]
  letter_freqs << ['D', 4]
  letter_freqs << ['G', 3]
  letter_freqs << ['B', 2]
  letter_freqs << ['C', 2]
  letter_freqs << ['M', 2]
  letter_freqs << ['P', 2]
  letter_freqs << ['F', 2]
  letter_freqs << ['H', 2]
  letter_freqs << ['V', 2]
  letter_freqs << ['W', 2]
  letter_freqs << ['Y', 2]
  letter_freqs << ['K', 1]
  letter_freqs << ['J', 1]
  letter_freqs << ['X', 1]
  letter_freqs << ['Q', 1]
  letter_freqs << ['Z', 1]
  
  scrabble_count = 100
  
  letter_array = []
  letter_freqs.each{ |i|
    letter = i[0] 
    scrabble_freq = i[1]
    person_freq = scrabble_freq.to_f * (person_count.to_f / scrabble_count) * FUDGE_FACTOR
    person_freq = person_freq.round
    person_freq = 1 if person_freq == 0
    (1..person_freq).each { 
      letter_array << letter 
      break if letter_array.size == person_count
    }
    break if letter_array.size == person_count    
  }
  
  letter_array.shuffle!
end


def simple_info()
  require 'pp'
  a = get_letter_array(80)
  ("A".."Z").each{|i|
    puts i + ": " + a.count(i).to_s
  }
  puts a.size
  
  num = 0
  words = File.new("../words.txt")
  words.each do |line|
    line.strip!
    line.upcase!
    word = line
    line = line.split(//)
    good = true
    ("A".."Z").each{|i|
      if a.count(i) < line.count(i)
        good = false
        break
      end
    }
    
    num += 1 if good
    puts word + ": " + num.to_s if good
    
  end
  puts num
end