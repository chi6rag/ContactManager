class EmailAddress < ActiveRecord::Base

	# associations
	belongs_to :person

	# vaidations
	validates :address, presence: true
	validates :person_id, presence: true

end