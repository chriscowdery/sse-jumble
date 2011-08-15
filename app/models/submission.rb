class Submission < ActiveRecord::Base
  belongs_to :word
  has_and_belongs_to_many :people

  validates_presence_of :word_id
end
