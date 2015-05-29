class Dog <ActiveRecord::Base
  belongs_to :teacher,polymorphic: :people
  belongs_to :soldier,polymorphic: :people
end