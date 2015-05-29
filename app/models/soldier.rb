class Soldier <ActiveRecord::Base
  has_one :dog,as: :people
end