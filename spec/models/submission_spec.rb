require 'spec_helper'

describe Submission do
  before :each do
    @b = create(:person, :letter => 'b')
    @l = create(:person, :letter => 'l')
    @a = create(:person, :letter => 'a')
    @h = create(:person, :letter => 'h')

    @people = [@b, @l, @a, @h]

    @word1 = create(:word, :word => 'blah')
  end

  it "should accept valid words" do
    sub = build(:submission, :magic_string => nil)
    sub.magic_string = @people.inject("") { |memo,obj| memo + ("%02d" % obj.id) }
    sub.save!
    sub.should be_valid
  end

  it "should have a people association" do
    sub = create(:submission)
  end
end
