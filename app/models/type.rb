class Type < ActiveRecord::Base
  has_many :task_types
  has_many :tasks, through: :task_types
end