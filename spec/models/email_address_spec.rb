require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
	context "for Company" do
		let(:awesome_corp){ Company.create(name: 'AwesomeCorp') }
		let(:email_address){
			EmailAddress.new(
			  address: 'contact@awesomecorp.com',
			  contact_id: awesome_corp.id,
			  contact_type: awesome_corp.class.to_s
	      )
		}

		it "is valid" do 
			expect(email_address).to be_valid
		end

		it "is invalid without address" do 
			email_address.address = nil
			expect(email_address).to_not be_valid
		end

		it "is invalid without contact" do
			email_address.contact_id = nil
			expect(email_address).to_not be_valid
		end

		it "is invalid without a contact type" do 
			email_address.contact_type = nil
			expect(email_address).to_not be_valid
		end

		it "responds to contact" do 
			expect(email_address).to respond_to(:contact)
		end
	end

	context "for Person" do
		let(:bob){ Person.create(first_name: 'Bob', last_name: 'Builder') }
		let(:email_address){
			EmailAddress.new(
			  address: 'bobbuilder@gmail.com',
			  contact_id: bob.id,
			  contact_type: bob.class.to_s
	      )
		}

		it "is valid" do 
			expect(email_address).to be_valid
		end

		it "is invalid without address" do 
			email_address.address = nil
			expect(email_address).to_not be_valid
		end

		it "is invalid without contact" do
			email_address.contact_id = nil
			expect(email_address).to_not be_valid
		end

		it "is invalid without a contact type" do 
			email_address.contact_type = nil
			expect(email_address).to_not be_valid
		end

		it "responds to contact" do 
			expect(email_address).to respond_to(:contact)
		end
	end
end