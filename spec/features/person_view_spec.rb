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

	it "shows a link to add a new phone number" do 
		expect(page).to have_link('Add new Phone Number', href: new_phone_number_path(person_id: person.id))
	end

	it "adds a new phone number" do 
		click_on 'Add new Phone Number'
		within('form') do 
			fill_in 'Number', with: '+919999174467'
			click_button 'Create Phone Number'
		end
		expect(current_path).to eq(person_path(person))
		expect(page).to have_content('+919999174467')
	end

end