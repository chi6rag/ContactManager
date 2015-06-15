require 'rails_helper'

describe 'the person view', type: :feature do
	let(:person){ Person.create(first_name: 'Jon', last_name: 'Doe') }

	before(:each) do
		person.phone_numbers.create!(number: '9999999999')
		person.phone_numbers.create!(number: '8888888888')
		visit person_path(person)
	end

	it "shows a list of phone numbers" do 
		person.phone_numbers.each do |phone_number|
			expect(page).to have_content(phone_number.number)
		end
	end

end