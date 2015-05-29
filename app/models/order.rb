class Order < ActiveRecord::Base
  belongs_to :client, counter_cache: true
  validates :order_no, uniqueness: true

  before_validation :do_something_before_validation
  #after_find :do_something_after_find
  after_find ClientCallBacks

  #these two before_save callback is the same
  #before_save :do_something_before_save, if: Proc.new { |order| order.client.nil? }
   before_save :do_something_before_save, if: :client_is_nil?
   def client_is_nil?
     self.client.nil?
   end

  def do_something_after_find
    puts "after find callback"
  end
  def do_something_before_save
    puts "before save callback! this order does not have a client!"
  end
  #?whether can pass a parameter?
  def do_something_before_validation
    puts "before validation callback"
  end

  #set a default filter in the table
  default_scope { where ("client_id is not null") }

  scope :belongs_to_alin, -> { joins(:client).where("clients.name='Alin'") }


end