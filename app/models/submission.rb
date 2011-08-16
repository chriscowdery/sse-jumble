class Submission < ActiveRecord::Base
  belongs_to :word
  has_and_belongs_to_many :people

  validates_presence_of :magic_string, :word_id
  validates_uniqueness_of :magic_string

  before_validation :set_word_and_people
  after_save :validate_group_trickery

private

  def set_word_and_people
    temp_people = []
    temp_word = ""
    temp_magic_string = magic_string.dup
    until temp_magic_string.length == 0
      temp_people << Person.find(temp_magic_string.slice!(0..1).to_i)
      temp_word << temp_people.last.letter
    end

    self.word = Word.find_by_word(temp_word)
    self.people = temp_people
  end

  def validate_group_trickery
    submissions = Submission.where(:word_id => self.word_id)
    submissions.each do |s|
      if s.people.sort_by { |p| p.id } == self.people.sort_by { |p| p.id }
        raise ActiveRecord::Rollback, "Group has already submitted this word!"
      end
    end
  end

end
