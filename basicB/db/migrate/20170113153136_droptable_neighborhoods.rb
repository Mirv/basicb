class DroptableNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    drop_table :neighborhoods
  end
end
