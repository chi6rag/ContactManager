require 'rails_helper'

describe 'the person view', type: :feature do
	let(:person){ Person.create(first_name: 'Jon', last_name: 'Doe') }

	before(:each) do
		person.phone_numbers.create!(number: '9999999999')
		person.phone_numbers.create!(number: '8888888888')
		person.email_addresses.create!(address: 'janedoe@example.com')
		person.email_addresses.create!(address: 'johndoe@example.com')
		visit person_path(person)
	end

	# phone numbers

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
			click_button 'Create Phone number'
		end
		expect(current_path).to eq(person_path(person))
		expect(page).to have_content('+919999174467')
	end

	it "has links to edit a phone number" do
		person.phone_numbers.each do |phone_number|
			expect(page).to have_link('Edit', href: edit_phone_number_path(phone_number))
		end
	end

	it "updates a phone number" do 
		phone_number = person.phone_numbers.first
		click_link('Edit', href: edit_phone_number_path(phone_number))
		within('form') do 
			fill_in 'Number', with: '+19876543210'
			click_button 'Update Phone number'
		end
		expect(current_path).to eq(person_path(person))
		expect(page).to have_content('+19876543210')
		expect(page).to_not have_content(phone_number.number)
	end

	it "has a link to delete a phone number" do 
		phone_number = person.phone_numbers.first
		expect(page).to have_link("Delete", destroy_phone_number_path(phone_number))
	end

	it "deletes a phone number" do 
		phone_number = person.phone_numbers.first
		click_link("Delete", href: destroy_phone_number_path(phone_number))
		expect(current_path).to eq(person_path(phone_number.person))
		expect(page).to_not have_content(phone_number.number)
	end

	# email addresses

	it "shows a list of email addresses" do
		person.email_addresses.each do |email|
			expect(page).to have_content(email.address)
		end
	end

	it "shows a link to add a new email address" do 
		expect(page).to have_link("Add new Email Address", href: new_email_address_path(person_id: person.id))
	end

	it "adds a new email address" do 
		click_link("Add new Email Address", href: new_email_address_path(person_id: person.id))
		within('form') do 
			fill_in 'Address', with: 'superman_johndoe@example.com'
			click_button 'Create Email address'
		end
		expect(current_path).to eq(person_path(person))
		expect(page).to have_content('superman_johndoe@example.com')
	end

	it "shows a link to edit an email address" do 
		email_address = person.email_addresses.first
		expect(page).to have_link("Edit", href: edit_email_address_path(email_address))
	end

	it "edits an email address" do 
		email_address = person.email_addresses.first
		click_link("Edit", href: edit_email_address_path(email_address))
		within('form') do 
			fill_in 'Address', with: 'johndoe_new@example.com'
			click_button "Update Email address"
		end
		expect(current_path).to eq(person_path(person))
		expect(page).to have_content('johndoe_new@example.com')
	end

end