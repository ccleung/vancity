class Post < ActiveRecord::Base
	belongs_to :user
	has_one :image, as: :imageable

	extend FriendlyId
	friendly_id :title, use: [:slugged, :history]
end
