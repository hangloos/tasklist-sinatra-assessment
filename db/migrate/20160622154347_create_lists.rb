class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |x|
      x.string :name
      x.integer :user_id
    end
  end
end
