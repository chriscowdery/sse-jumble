require 'spec_helper'

describe "submissions/edit.html.erb" do
  before(:each) do
    @submission = assign(:submission, stub_model(Submission,
      :word => nil
    ))
  end

  it "renders the edit submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => submissions_path(@submission), :method => "post" do
      assert_select "input#submission_word", :name => "submission[word]"
    end
  end
end
