class Client <ActiveRecord::Base
  has_one :address
  has_many :orders
  has_and_belongs_to_many :roles

  after_find ClientCallBacks
  #take care!only class "Client" and AssociationRecord can call this method.
  #for example:ActiveRecord can not =>Order.first.client.lives_in_london is wrong !!
  #Execute: Client.lives_in_london
  #Sql: SELECT "clients".* FROM "clients" INNER JOIN "addresses" ON "addresses"."client_id" = "clients"."id" WHERE (addresses.name='London')
  #Result:<ActiveRecord::Relation>
  scope :lives_in_london, ->  {joins(:address).where("addresses.name='London'")}

  #This scope is same with the next code:
  # def self.lives_in_london
  #   joins(:address).where("addresses.name='London'")
  # end
end