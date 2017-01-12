class AddIndexToNeighborhoods2 < ActiveRecord::Migration[5.0]
  def change
    add_index :neighborhoods, :neighbor_id
  end
end
