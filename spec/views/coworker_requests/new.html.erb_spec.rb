require 'spec_helper'

describe "coworker_requests/new.html.erb" do
  before(:each) do
    assign(:coworker_request, stub_model(CoworkerRequest,
      :quantity => "",
      :position => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new coworker_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => coworker_requests_path, :method => "post" do
      assert_select "input#coworker_request_quantity", :name => "coworker_request[quantity]"
      assert_select "input#coworker_request_position", :name => "coworker_request[position]"
      assert_select "input#coworker_request_user", :name => "coworker_request[user]"
    end
  end
end
