class Location < ApplicationRecord
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

	belongs_to :user, optional: true
	belongs_to :dojo, optional: true
end
