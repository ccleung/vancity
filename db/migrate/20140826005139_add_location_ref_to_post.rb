class AddLocationRefToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :location, index: true
  end
end
