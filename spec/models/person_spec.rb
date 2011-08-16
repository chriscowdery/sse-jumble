require 'spec_helper'

describe Person do
  it "should require a letter" do
    p = build(:person, :letter => nil)
    p.should_not be_valid

    p.letter = 'a'
    p.should be_valid
  end

  it "should require a first and last name" do
    p = build(:person, :first_name => nil)
    p.should_not be_valid

    p.first_name = 'John'
    p.last_name = nil
    p.should_not be_valid

    p.last_name = 'Doe'
    p.should be_valid
  end

  it "should have a submissions association" do
    p = create(:person)
    p.submissions.should_not be_nil
  end
end
