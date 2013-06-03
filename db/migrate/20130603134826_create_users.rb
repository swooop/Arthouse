class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name_first
      t.string :name_last
      t.string :email

      t.timestamps
    end
  end
end
