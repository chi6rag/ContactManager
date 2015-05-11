class Person < ActiveRecord::Base
	include Contact
	# has_many :phone_numbers, as: :contact
	# has_many :email_addresses, as: :contact
	validates :first_name, presence: true
	validates :last_name, presence: true

	def to_s
		"#{first_name} #{last_name}"
	end
end