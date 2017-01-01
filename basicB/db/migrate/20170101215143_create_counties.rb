class CreateCounties < ActiveRecord::Migration[5.0]
  def change
    create_table :counties do |t|
      t.string :name
      t.text :description
      t.integer :state_id

      t.timestamps
    end
  end
end
