class PhoneNumber < ActiveRecord::Base
	belongs_to :contact, polymorphic: true
	validates :contact_id, presence: true
	validates :number, presence: true
end