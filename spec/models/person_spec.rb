require 'rails_helper'

RSpec.describe Person, type: :model do
	let(:person) do
		Person.new(first_name: 'Jon', last_name: 'Doe')
	end

	it "is invalid without the first name" do 
		person.first_name = nil
		expect(person).to_not be_valid
	end

	it "is invalid without the last name" do 
		person.last_name = nil
		expect(person).to_not be_valid
	end

	it "is valid" do
		expect(person).to be_valid
	end

end