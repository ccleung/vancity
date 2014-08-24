class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :parent
      t.references :category

      t.timestamps
    end
  end
end
