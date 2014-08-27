class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :location
	has_one :image, as: :imageable
	scope :category, -> (category_id) { where category_id: category_id }

	extend FriendlyId
	friendly_id :slug_candidates, use: [:slugged, :history]

	def slug_candidates
    [
      :title,
      [:title, :location_id],
      [:title, :location_id, :category_id]
    ]
  end
end
