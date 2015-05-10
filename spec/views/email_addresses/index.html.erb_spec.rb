require 'rails_helper'

RSpec.describe "email_addresses/index", type: :view do
  before(:each) do

    person = Person.create!(
      :id => 1,
      :first_name => 'Chirag',
      :last_name => 'Aggarwal'
    )

    assign(:email_addresses, [
      EmailAddress.create!(
        :address => "example@gmail.com",
        :contact_id => 1,
        :contact_type => person.class.to_s
      ),
      EmailAddress.create!(
        :address => "example@gmail.com",
        :contact_id => 1,
        :contact_type => person.class.to_s
      )
    ])
  end

  it "renders a list of email_addresses" do
    render
    assert_select "tr>td", :text => "example@gmail.com", :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 'Person', :count => 2
  end
end
