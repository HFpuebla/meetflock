require 'spec_helper'

describe "coworker_requests/index.html.erb" do
  before(:each) do
    assign(:coworker_requests, [
      stub_model(CoworkerRequest,
        :quantity => "",
        :position => nil,
        :user => nil
      ),
      stub_model(CoworkerRequest,
        :quantity => "",
        :position => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of coworker_requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
