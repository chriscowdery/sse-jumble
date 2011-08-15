require 'spec_helper'

describe "submissions/index.html.erb" do
  before(:each) do
    assign(:submissions, [
      stub_model(Submission,
        :word => nil
      ),
      stub_model(Submission,
        :word => nil
      )
    ])
  end

  it "renders a list of submissions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
