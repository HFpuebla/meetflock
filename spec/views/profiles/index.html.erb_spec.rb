require 'spec_helper'

describe "profiles/index.html.erb" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :name => "Name",
        :motto => "MyText",
        :website => "Website",
        :status => "Status",
        :receive_newsletter => false,
        :location => nil
      ),
      stub_model(Profile,
        :name => "Name",
        :motto => "MyText",
        :website => "Website",
        :status => "Status",
        :receive_newsletter => false,
        :location => nil
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
