class PhoneNumber < ActiveRecord::Base
	validates :person_id, presence: true
	validates :number, presence: true
end