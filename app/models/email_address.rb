class EmailAddress < ActiveRecord::Base

	# associations

	# vaidations
	validates :address, presence: true
	validates :person_id, presence: true

end