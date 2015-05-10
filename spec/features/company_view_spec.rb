require 'rails_helper'

describe 'The Company View', type: :feature do 
	let(:company) { Company.create(name: 'AwesomeCorp') }

	describe "Phone Numbers Table" do 
		before(:each) do
			company.phone_numbers.create(number: '+919999174467')
			company.phone_numbers.create(number: '+919555729555')
			visit company_path(company)
		end

		it "shows the phone numbers" do
			company.phone_numbers.each do |phone_number|
				expect(page).to have_content(phone_number.number)
			end
		end

		it "has a link to add a new phone number" do 
			expect(page).to have_link("Add new Phone Number", href: new_phone_number_path(contact_id: company.id, contact_type: company.class.to_s))
		end

		it 'adds a new phone number' do
		  page.click_link('Add new Phone Number')
		  page.fill_in('Number', with: '555-8888')
		  page.click_button('Create Phone number')
		  expect(current_path).to eq(company_path(company))
		  expect(page).to have_content('555-8888')
		end

		it "has links to edit phone number" do
			company.phone_numbers.each do |phone_number|
				expect(page).to have_link("Edit", href: edit_phone_number_path(phone_number))
			end
		end

		it "edits a phone number" do
			phone = company.phone_numbers.first
			old_number = phone.number
			first(:link, "Edit").click
			fill_in("Number", with: "+919871031117")
			click_button("Update Phone number")
			expect(current_path).to eq(company_path(company))
			expect(page).to have_content("+919871031117")
			expect(page).to_not have_content(old_number)
		end

		it "has links to delete phone number" do 
			company.phone_numbers.each do |phone_number|
				expect(page).to have_link("Delete", href: phone_number_path(phone_number))
			end
		end

		it "deletes the phone number" do 
			phone = company.phone_numbers.first
			number_to_delete = phone.number
			first(:link, "Delete").click
			expect(current_path).to eq(company_path(company))
			expect(page).to_not have_link("Delete", href: phone_number_path(phone))
		end
	end

	describe "Email Address Table" do 
		before(:each) do 
			company.email_addresses.create(address: 'hello@awesomecorp.com')
			company.email_addresses.create(address: 'contact@awesomecorp.com')
			visit company_path(company)
		end

		it "has email addresses" do 
			company.email_addresses.each do |email_address|
				expect(page).to have_selector('td', text: email_address.address)
			end
		end

		it "has link to add a new email address" do
			expect(page).to have_link("Add new Email Address", href: new_email_address_path(contact_id: company.id, contact_type: company.class.to_s))
		end

		it "adds a new email address" do 
			click_link("Add new Email Address", href: new_email_address_path(contact_id: company.id, contact_type: company.class.to_s))
			fill_in("Address", with: "carreers@awesomecorp.com")
			click_button("Create Email address")
			expect(current_path).to eq(company_path(company))
			expect(page).to have_selector('td', text: "carreers@awesomecorp.com")
		end

		it "has links to edit email address" do 
			within('.email_addresses_table') do
				company.email_addresses.each do |email_address|
					expect(page).to have_selector('td', text: email_address.address)
				end
			end
		end

		it "edits an existing email address" do 
			old_email = company.email_addresses.first
			new_email = "hi@awesomecorp.com"
			within('.email_addresses_table') do
				first(:link, "Edit").click
      end
    	fill_in("Address", with: new_email)
    	click_button "Update Email address"
    	expect(current_path).to eq(company_path(company))
    	expect(page).to have_selector('td', text: new_email)
		end

		it "has links to delete email addresses" do
			within('.email_addresses_table') do 
				company.email_addresses.each do |email_address|
					expect(page).to have_link("Delete", email_address_path(email_address))
				end
			end
		end

		it "deletes an existing email address" do 
			existing_email_address = company.email_addresses.first
			within('.email_addresses_table') do 
				first(:link, "Delete").click
			end
			expect(current_path).to eq(company_path(company))
			expect(page).to_not have_selector('td', text: existing_email_address)
		end

	end

end