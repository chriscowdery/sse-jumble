class GroupTrickeryValidator < ActiveModel::Validator
  def validate(record)
    submissions = Submission.where(:word_id => record.word_id)

    submissions.each do |s|
      if s.people.sort_by { |p| p.id } == record.people.sort_by { |p| p.id }
        record.errors[:base] << "Word has already been created by this group."
        break
      end
    end
  end
end

class WordLengthEqualsNumberOfPeopleValidator < ActiveModel::Validator
  def validate(record)
    unless record.word.word.length == record.people.count
      record.errors[:base] << "Word length does not match number of people. (word: #{record.word.word}, people count: #{record.people.count})"
    end
  end
end

class Submission < ActiveRecord::Base
  belongs_to :word
  has_and_belongs_to_many :people

  validates_presence_of :word_id
  validates_with GroupTrickeryValidator
  validates_with WordLengthEqualsNumberOfPeopleValidator
end
