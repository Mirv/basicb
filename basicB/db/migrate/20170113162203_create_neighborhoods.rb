class CreateNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhoods do |t|
      t.integer :neighbor_id
      t.integer :target_id

      t.timestamps
    end
  end
end
