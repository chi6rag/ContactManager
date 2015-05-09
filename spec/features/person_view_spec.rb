require 'rails_helper'

describe 'The Person View', type: :feature do 
	let(:person) { Person.create(first_name: "John", last_name: "Doe") }

	describe "Phone Numbers Table" do 
		before(:each) do 
			person.phone_numbers.create(number: '+919999174467')
			person.phone_numbers.create(number: '+919555729555')
			visit person_path(person)
		end

		it "shows the phone numbers" do
			person.phone_numbers.each do |phone_number|
				expect(page).to have_content(phone_number.number)
			end
		end

		it "has a link to add a new phone number" do 
			expect(page).to have_link("Add new Phone Number", href: new_phone_number_path(person_id: person.id))
		end

		it 'adds a new phone number' do
		  page.click_link('Add new Phone Number')
		  page.fill_in('Number', with: '555-8888')
		  page.click_button('Create Phone number')
		  expect(current_path).to eq(person_path(person))
		  expect(page).to have_content('555-8888')
		end

		it "has links to edit phone number" do
			person.phone_numbers.each do |phone_number|
				expect(page).to have_link("Edit", href: edit_phone_number_path(phone_number))
			end
		end

		it "edits a phone number" do
			phone = person.phone_numbers.first
			old_number = phone.number
			first(:link, "Edit").click
			fill_in("Number", with: "+919871031117")
			click_button("Update Phone number")
			expect(current_path).to eq(person_path(person))
			expect(page).to have_content("+919871031117")
			expect(page).to_not have_content(old_number)
		end

		it "has links to delete phone number" do 
			person.phone_numbers.each do |phone_number|
				expect(page).to have_link("Delete", href: phone_number_path(phone_number))
			end
		end

		it "deletes the phone number" do 
			phone = person.phone_numbers.first
			number_to_delete = phone.number
			first(:link, "Delete").click
			expect(current_path).to eq(person_path(person))
			expect(page).to_not have_link("Delete", href: phone_number_path(phone))
		end
	end

	describe "Email Address Table" do 
		before(:each) do 
			person.email_addresses.create(address: 'johndoe@example.com')
			person.email_addresses.create(address: 'john.doe@example.com')
			visit person_path(person)
		end

		it "has email addresses" do 
			person.email_addresses.each do |email_address|
				expect(page).to have_selector('td', text: email_address.address)
			end
		end
	end
end