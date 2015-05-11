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

	it "responds with its created phone number" do 
		person.phone_numbers.build(number: '+919555729555')
		expect(person.phone_numbers.map(&:number)).to eq(['+919555729555'])
	end

	it "responds with its created email_address" do 
		person.email_addresses.build(address: 'alicegreen@gmail.com')
		expect(person.email_addresses.map(&:address)).to eq(['alicegreen@gmail.com'])
	end

	it "convert to a string with last_name, first_name" do 
		expect(person.to_s).to eq("Alice Green")
	end

end
