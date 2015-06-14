class Person < ActiveRecord::Base
	# associations
	has_many :phone_numbers

	# validations
	validates :first_name, presence: true
	validates :last_name, presence: true

end