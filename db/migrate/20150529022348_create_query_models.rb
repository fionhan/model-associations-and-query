class CreateQueryModels < ActiveRecord::Migration
  def change

    create_table :addresses do |t|
      t.string :name
      t.belongs_to :client
      t.timestamps
    end
    create_table :orders do |t|
      t.string :order_no
      t.belongs_to :client
      t.timestamps
    end

    create_table :clients do |t|
      t.string :name
      t.integer :orders_count
      t.timestamps
    end

    create_table :roles do |t|
      t.string :name
      t.timestamps
    end

    create_table :clients_roles,id:false do |t|
      t.integer :client_id
      t.integer :role_id
    end

  end
end
