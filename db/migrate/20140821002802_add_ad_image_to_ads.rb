class AddAdImageToAds < ActiveRecord::Migration
  def change
    add_column :ads, :ad_image, :string
  end
end
