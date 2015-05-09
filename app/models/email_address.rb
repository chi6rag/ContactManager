class EmailAddress < ActiveRecord::Base
	validates :address, presence: true
  validates :person_id, presence: true
end