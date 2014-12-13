class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :location
	belongs_to :category
	has_one :image, as: :imageable
	scope :category, -> (category_id) { where category_id: category_id }
  validates_presence_of :user_id
  validates :title, presence: { message: "You must input a title" }
  validates :description, presence: { message: 'You must input a description' }
  validates :category, presence: { message: 'Please select a category' }
  validates :location, presence: { message: 'Please select a location' }

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
