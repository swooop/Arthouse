class AddArtworkToImages < ActiveRecord::Migration
  def change
    add_column :images, :artwork, :string
  end
end
