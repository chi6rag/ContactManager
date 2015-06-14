require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(first_name: 'Jon', last_name: 'Doe'),
      Person.create!(first_name: 'Jane', last_name: 'Doe')
    ])
  end

  it "renders a list of people" do
    render
  end
end
