class CreateTaskTypes < ActiveRecord::Migration
  def change
    create_table :task_types do |x|
      x.integer :task_id
      x.integer :type_id
    end
  end
end
