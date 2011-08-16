require 'spec_helper'

describe Word do
  it "should just work" do
    word = build(:word)
    word.should be_valid

    word.save.should be_true
  end
end
