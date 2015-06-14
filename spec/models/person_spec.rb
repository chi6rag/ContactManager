require 'rails_helper'

RSpec.describe Person, type: :model do

	it "is invalid without the first name" do 
		person = Person.create(first_name: nil, last_name: 'Doe')
		expect(person).to_not be_valid
	end

end