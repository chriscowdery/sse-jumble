class Letter < ActiveRecord::Base
  validates_uniqueness_of :letter
  validates_presence_of :score
end
