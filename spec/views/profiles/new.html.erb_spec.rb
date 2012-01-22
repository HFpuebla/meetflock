require 'spec_helper'

describe "profiles/new.html.erb" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :name => "MyString",
      :motto => "MyText",
      :website => "MyString",
      :status => "MyString",
      :receive_newsletter => false,
      :location => nil
    ).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profiles_path, :method => "post" do
      assert_select "input#profile_name", :name => "profile[name]"
      assert_select "textarea#profile_motto", :name => "profile[motto]"
      assert_select "input#profile_website", :name => "profile[website]"
      assert_select "input#profile_status", :name => "profile[status]"
      assert_select "input#profile_receive_newsletter", :name => "profile[receive_newsletter]"
      assert_select "input#profile_location", :name => "profile[location]"
    end
  end
end
