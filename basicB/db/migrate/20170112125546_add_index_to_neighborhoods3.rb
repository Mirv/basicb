class AddIndexToNeighborhoods3 < ActiveRecord::Migration[5.0]
  def change
    add_index :neighborhoods, [:target_id, :neighbor_id], unique: true
  end
end
