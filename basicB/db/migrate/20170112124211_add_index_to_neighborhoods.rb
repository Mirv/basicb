class AddIndexToNeighborhoods < ActiveRecord::Migration[5.0]
  def change
      add_index :neighborhoods, :target_id
  end
end
