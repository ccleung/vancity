class Ad < ActiveRecord::Base
	belongs_to :user
	has_many :images, as: :imageable

	extend FriendlyId
	friendly_id :title, use: [:slugged, :history]
end
