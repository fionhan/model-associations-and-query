class CreateAssembliesPartsJoinTable < ActiveRecord::Migration
  def change
    create_table :assemblies_parts,id:false do |t|
      t.integer :assembly_id
      t.integer :part_id
    end
  end
end
