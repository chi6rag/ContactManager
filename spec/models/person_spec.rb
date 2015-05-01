require 'rails_helper'

RSpec.describe Person, type: :model do
  it "is invalid without a first name" do
  	person = Person.new
  	expect(person).not_to be_valid
  end

  it "is invalid without last name" do
  	person = Person.new(first_name: 'Jon', last_name: nil)
  	expect(person).not_to be_valid
  end
end