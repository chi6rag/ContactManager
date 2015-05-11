require 'rails_helper'

RSpec.describe "email_addresses/new", type: :view do
  let(:person){
    Person.create(
      :first_name => "Chirag",
      :last_name => "Aggarwal"
    )
  }

  let(:email_address){
    EmailAddress.new(
      :address => "chi6rag@gmail.com",
      :contact_id => person.id,
      :contact_type => person.class.to_s
    )
  }

  before(:each) do
    assign(:email_address, email_address)
  end

  it "renders new email_address form" do
    render

    assert_select "form[action=?][method=?]", email_addresses_path, "post" do

      assert_select "input#email_address_address[name=?]", "email_address[address]"

      assert_select "input#email_address_contact_id[name=?]", "email_address[contact_id]"
    end
  end

  it "shows the contact's name in the title" do
    render
    assert_select("h1", text: "New Email Address for #{email_address.contact.first_name} #{email_address.contact.last_name}")
  end
end
