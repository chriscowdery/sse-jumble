require 'spec_helper'

describe Submission do
  before :each do
    @b = create(:person, :letter => 'b')
    @l = create(:person, :letter => 'l')
    @a = create(:person, :letter => 'a')
    @h = create(:person, :letter => 'h')

    @word1 = create(:word, :word => 'blah')
    @word2 = create(:word, :word => 'blahblah')
    @word3 = create(:word, :word => 'blahblahblah')
  end


end
