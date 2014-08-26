class AddIndexToLocation < ActiveRecord::Migration
  def change
  	add_index :locations, [:city, :region, :country], :unique=>true
  end
end
