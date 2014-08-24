class RenameAds < ActiveRecord::Migration
  def change
  	rename_table :ads, :posts
  end
end
