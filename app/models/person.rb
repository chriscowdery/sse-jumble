class Person < ActiveRecord::Base
  has_and_belongs_to_many :submissions

  validates_presence_of :first_name, :last_name, :letter

  def score
    score = self.submissions.to_a.inject(0) { |sum, submission| sum + submission.word.score }
    return 0 if score == nil
    score
  end
end
