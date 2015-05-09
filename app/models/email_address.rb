class EmailAddress < ActiveRecord::Base
	validates :address, presence: true
end