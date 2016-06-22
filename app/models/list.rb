class List < ActiveRecord::Base
belongs_to :user
has_many :list_tasks
has_many :tasks, through: :list_tasks
has_many :task_types
has_many :types, through: :tasks 

end