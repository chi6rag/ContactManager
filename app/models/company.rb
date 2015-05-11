class Company < ActiveRecord::Base
	has_many :phone_numbers, as: :contact
	has_many :email_addresses, as: :contact
	validates :name, presence: true

	def to_s
		name
	end

end