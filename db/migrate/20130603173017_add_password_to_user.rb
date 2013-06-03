class AddPasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :hashed, :string
  end
end
