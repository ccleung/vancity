class RemoveParentFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :parent, :boolean
  end
end
