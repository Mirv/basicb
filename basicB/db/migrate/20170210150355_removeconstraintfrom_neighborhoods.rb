class RemoveconstraintfromNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    remove_index :Neighborhoods, [:target_id,:neighbor_id]
  end
end
