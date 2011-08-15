# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

names = File.new(File.join(Rails.root, "names.txt"))
names.each do |line|
  first_name = line.match(/, (.+)/).captures[0]
  last_name = line.match(/(.+),/).captures[0]

  Person.create(:first_name => first_name, :last_name => last_name)
end

words = File.new(File.join(Rails.root, "words.txt"))
words.each do |line|
  Word.create(:word => line) if line.length >= 3 # min word length of 3
end

