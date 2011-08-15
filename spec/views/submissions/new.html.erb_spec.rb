require 'spec_helper'

describe "submissions/new.html.erb" do
  before(:each) do
    assign(:submission, stub_model(Submission,
      :word => nil
    ).as_new_record)
  end

  it "renders new submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => submissions_path, :method => "post" do
      assert_select "input#submission_word", :name => "submission[word]"
    end
  end
end
