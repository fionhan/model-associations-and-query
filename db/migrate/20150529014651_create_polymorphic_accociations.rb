class CreatePolymorphicAccociations < ActiveRecord::Migration
  def change
    create_table :soldiers do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :teachers do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :dogs do |t|
      t.string :name
      t.string :people_type
      t.integer :people_id

      t.timestamps null: false
    end
  end
end
