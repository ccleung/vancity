class Ad < ActiveRecord::Base
	belongs_to :user
	mount_uploader :ad_image, AdImageUploader
end
