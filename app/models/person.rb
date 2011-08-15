class Person < ActiveRecord::Base
  has_and_belongs_to_many :submissions

  validates_presence_of :first_name, :last_name, :letter
end
