class Person < ActiveRecord::Base
	# associations
	has_many :phone_numbers
	has_many :email_addresses

	# validations
	validates :first_name, presence: true
	validates :last_name, presence: true

end