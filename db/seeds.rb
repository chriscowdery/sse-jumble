# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require File.join(Rails.root, 'db/letters.rb')

if Letter.count == 0
  letters = 'abcdefghijklmnopqrstuvwxyz'

  letters.chars.each do |c|
    Letter.create(:letter => c, :score => letter_score(c))
  end

  puts "#{Letter.count} letters seeded into DB"
end

if Person.count == 0
  names = File.new(File.join(Rails.root, "names.txt"))
  lines = []

  linecount = 0
  names.each do |line|
    line.strip!
    unless line == ""
      lines << line
      linecount += 1
    end
  end

  # letters = get_letter_array(linecount)

  lines.each do |line|
    letter = line[0].downcase

    line = line[2..line.length]

    first_name = line.match(/, (.+)/).captures[0]
    last_name = line.match(/(.+),/).captures[0]

    # TODO: assign letters to each person, keeping with the scrabble letter 
    # distribution of:
    #
    # 1 point: E ×12, A ×9, I ×9, O ×8, N ×6, R ×6, T ×6, L ×4, S ×4, U ×4
    # 2 points: D ×4, G ×3
    # 3 points: B ×2, C ×2, M ×2, P ×2
    # 4 points: F ×2, H ×2, V ×2, W ×2, Y ×2
    # 5 points: K ×1
    # 8 points: J ×1, X ×1
    # 10 points: Q ×1, Z ×1

    # letter = letters.pop()

    p = Person.create(:first_name => first_name, :last_name => last_name, :letter => letter)
  end

  puts "#{Person.count} people seeded into DB"
end

if Word.count == 0
  words = File.new(File.join(Rails.root, "words.txt"))
  words.each do |line|
    line.strip!

    next if line.length < 3

    score = line.chars.inject(0) { |memo,c| memo + Letter.find_by_letter(c).score }
    Word.create(:word => line, :score => score)
  end

  puts "#{Word.count} words seeded into DB"
end

if AllowedUser.count == 0
  AllowedUser.create([
    { :username => 'cjk7752' },
    { :username => 'cjc5976' },
    { :username => 'cxb3490' }
  ])

  puts "#{AllowedUser.count} allowed users seeded into DB"
end

