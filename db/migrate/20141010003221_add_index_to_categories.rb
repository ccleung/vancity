class AddIndexToCategories < ActiveRecord::Migration
  def change
  	add_index :categories, [:name, :category_id], :unique=>true
  end
end
