class AddLikeCountToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :like_count, :integer, default: 0
  end
end
