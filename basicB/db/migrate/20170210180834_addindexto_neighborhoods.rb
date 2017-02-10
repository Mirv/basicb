class AddindextoNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    add_index :Neighborhoods, [:target_id, :neighbor_id], :unique => true
  end
end
