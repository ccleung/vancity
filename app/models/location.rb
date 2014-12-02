class Location < ActiveRecord::Base
	has_many :posts
  alias_attribute :nation, :country
end
