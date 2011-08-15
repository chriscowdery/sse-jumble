# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

if Person.all.length == 0
  names = File.new(File.join(Rails.root, "names.txt"))
  names.each do |line|
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

    letters = 'abcdefghijklmnopqrstuvwxyz'
    letter = letters[Random.rand(26)] # temporary

    Person.create(:first_name => first_name, :last_name => last_name, :letter => letter)
  end
end

if Word.all.length == 0
  words = File.new(File.join(Rails.root, "words.txt"))
  words.each do |line|
    Word.create(:word => line) if line.length >= 3 # min word length of 3
  end
end

