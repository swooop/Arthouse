class AddUserToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :user_id, :integer
end
