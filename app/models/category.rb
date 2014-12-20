class Category < ActiveRecord::Base
	belongs_to :category
	has_many :categories
  has_many :posts

	validates_presence_of :name
end
