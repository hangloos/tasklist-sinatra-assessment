class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |x|
      x.string :name
    end
  end
end
