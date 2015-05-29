

client1=Client.create(name: "Alin")
client2=Client.create(name: "Bob")

address1=Address.create(name: "NewYork")
address1.update_attributes(client:client1)

address2=Address.create(name: "London")
address2.update_attributes(client:client2)

5.times do |i|
  client = Client.first
  client.orders << Order.create(order_no: "Alin#{i+1}")
end

5.times do |i|
  client = Client.last
  client.orders << Order.create(order_no: "Bob#{i+1}")
end


puts "client1.orders_count:#{client1.orders_count}"
puts "client1.orders.count:#{client1.orders.count}"
puts "client2.orders_count:#{client2.orders_count}"
puts "client2.orders.count:#{client2.orders.count}"






