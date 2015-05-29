class Teacher <ActiveRecord::Base
  has_one :dog,as: :people

end