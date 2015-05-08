require 'rails_helper'

RSpec.describe Person, type: :model do

	it "is invalid without the first name" do 
		person = Person.new(first_name: nil)
		expect(person).not_to be_valid
	end

	it "is invalid without the last name" do 
		person = Person.new(first_name: 'Bob', last_name: nil)
		expect(person).not_to be_valid
	end

end
