class PhoneNumber < ActiveRecord::Base
	# validations 
	validates :number, presence: true
	validates :person_id, presence: true
end