class Company < ActiveRecord::Base
	# validations
	validates :name, presence: true
end
