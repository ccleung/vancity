class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :image
      #t.integer :imageable_id # id of object this image belongs to
      #t.string :imageable_type # type of object this image belongs to
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
