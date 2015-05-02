require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:phone_number){ PhoneNumber.new(number: "9555729555", person_id: 1) }

  it "must be valid" do
  	expect(phone_number).to be_valid
  end

  it "must not accept a blank number" do
  	phone_number.number = nil
  	expect(phone_number).to_not be_valid
  end

  it "must not accept a blank person" do
  	phone_number.person_id = nil
  	expect(phone_number).to_not be_valid
  end

end
