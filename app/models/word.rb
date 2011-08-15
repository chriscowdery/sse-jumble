class Word < ActiveRecord::Base
  has_many :submissions

  validates_presence_of :word
end
