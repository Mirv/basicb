class CreateNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhoods do |t|
      t.integer :country_id
      t.integer :neighbor_id

      t.timestamps
    end
  end
end
