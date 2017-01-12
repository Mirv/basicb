class Neighbor < ActiveRecord::Migration[5.0]
  def change
    create_table :neighbor do |t|
      t.integer :central_id
      t.integer :neighboring_id
      
      t.timestamps
    end
    add_index :neighbor,  :central_id
    add_index :neighbor,  :neighboring_id
    add_index :neighbor,  [:central_id, :neighboring_id], unique: true
  end
end
