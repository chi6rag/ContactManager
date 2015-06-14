require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(first_name: 'Jon', last_name: 'Doe'))
  end

  it "renders attributes in <p>" do
    render
  end
end
