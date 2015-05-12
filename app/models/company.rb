class Company < ActiveRecord::Base
	include Contact
	# has_many :phone_numbers, as: :contact
	# has_many :email_addresses, as: :contact
	validates :name, presence: true
	belongs_to :user

	def to_s
		name
	end

end