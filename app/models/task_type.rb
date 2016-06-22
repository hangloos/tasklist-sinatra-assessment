class TaskType < ActiveRecord::Base
  belongs_to :task 
  belongs_to :type
end