class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |x|
      x.string :name
    end
  end
end
