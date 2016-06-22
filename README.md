# tasklist-sinatra-assessment
A task list app that uses CRUD. This is for my Flatiron School Sinatra Assessment. 

Program Organization Notes:

Classes:

User - has_many lists. has_many tasks, through lists
List - belongs_to a user, has_many list_tasks, has_many tasks through list_tasks
Task - has_many list_tasks, has_many lists, through list_tasks,  belongs_to a user, through list.
list_task - belongs_to :list, belongs_to :task


Tables:

users- name
lists - name, user_id
tasks - name, fitness, coding, trading, other (these will be category arrays that can list out certain smaller lists inside my list) 
list_tasks - list_id, task_id
