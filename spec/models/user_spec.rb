require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user){ Fabricate(:user) }
	
	it "has associated people" do 
		expect(user.people).to be_a Person::ActiveRecord_Associations_CollectionProxy
	end

	it "builds associated people" do 
		person_1 = Fabricate(:person)
		person_2 = Fabricate(:person)
		[person_1, person_2].each do |person|
			expect(user.people).to_not include(person)
			user.people << person
			expect(user.people).to include(person)
		end
	end

	it "builds associated companies" do 
    company_1 = Fabricate(:company)
    company_2 = Fabricate(:company)
    [company_1, company_2].each do |company|
      expect(user.companies).to_not include(company)
      user.companies << company
      expect(user.companies).to include(company)
    end
  end
end