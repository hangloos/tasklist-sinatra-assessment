class CreateListTasks < ActiveRecord::Migration
  def change
    create_table :list_tasks do |x|
      x.integer :list_id
      x.integer :task_id
    end
  end
end
