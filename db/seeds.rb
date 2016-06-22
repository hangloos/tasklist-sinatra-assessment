#seed databse with 'rake db:seed' - reminder

eric = User.create(username: "hangloos", email: "ericloos00@gmail.com", password: "12345")
list1 = List.create(name: "Wednesday Tasks")
list1.save
list1.user_id = eric.id
eric.lists << list1

task1 = Task.create(name: "code my assessment")
task1.lists << list1
list1.tasks << task1 

#now eric has these tasks that are under this list. 

type1 = Type.new(name: "coding work")
type1.save
type.tasks << task1
task.type << type1

#Now eric has types and tasks. He can go into types and pull out the tasks for that type. So eric.types[0].tasks. 