class PhoneNumber < ActiveRecord::Base
	belongs_to :person
	validates :person_id, presence: true
	validates :number, presence: true
end