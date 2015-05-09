require 'rails_helper'

RSpec.describe Person, type: :model do

	let(:person) do 
		Person.new(first_name: "Alice", last_name: "Green")
	end

	it "is invalid without the first name" do 
		person.first_name = nil
		expect(person).not_to be_valid
	end

	it "is invalid without the last name" do 
		person.last_name = nil
		expect(person).not_to be_valid
	end

	it "is valid" do 
		expect(person).to be_valid
	end

	it "has an array of phone numbers" do 
		expect(person.phone_numbers).to eq([])
	end

	it "has an array of email address" do 
		expect(person.email_addresses).to eq([])
	end

end
