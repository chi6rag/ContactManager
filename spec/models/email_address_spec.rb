require 'rails_helper'

RSpec.describe EmailAddress, type: :model do

	let(:person){
		Person.create(first_name: 'John', last_name: 'Doe')
	}

	let(:email_address){
		EmailAddress.new(address: 'johndoe@example.com', person_id: person.id)
	}

	it "is invalid without address" do 
		email_address.address = nil
		expect(email_address).to_not be_valid
	end

	it "is invalid without person id" do 
		email_address.person_id = nil
		expect(email_address).to_not be_valid
	end

	it "is valid" do 
		expect(email_address).to be_valid
	end

end
