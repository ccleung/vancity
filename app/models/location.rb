class Location < ActiveRecord::Base
	has_many :posts
  alias_attribute :nation, :country
  # TODO: buggy
  validates_presence_of :city, :nation
end
