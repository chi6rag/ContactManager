class PhoneNumber < ActiveRecord::Base
	# validations 
	validates :number, presence: true
end