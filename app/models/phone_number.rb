class PhoneNumber < ActiveRecord::Base
	# validations 
	validates :number, presence: true
	validates :person_id, presence: true

	# associations
	belongs_to :person
end