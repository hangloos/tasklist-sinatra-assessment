class Task < ActiveRecord::Base
  has_many :list_tasks
  has_many :lists, through: :list_tasks
  has_many :task_types
  has_many :types, through: :task_types
end