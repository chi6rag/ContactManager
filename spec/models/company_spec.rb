require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company){ Company.new(name: "LoremState") }

  it "is valid" do 
  	expect(company).to be_valid
  end

  it "is not valid without a name" do
  	company.name = nil
  	expect(company).to_not be_valid
  end

  it "responds with its phone numbers after they're created" do
  	company.phone_numbers.build(number: '+919999999999')
  	expect(company.phone_numbers.map(&:number)).to eq(['+919999999999'])
  end

  it "responds with its created email address" do 
    company.email_addresses.build(address: 'contact@awesomecorp.com')
    expect(company.email_addresses.map(&:address)).to eq(['contact@awesomecorp.com'])
  end
end