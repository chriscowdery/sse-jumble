class Submission < ActiveRecord::Base
  belongs_to :word
  has_and_belongs_to_many :people
end
