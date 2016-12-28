class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.text :description
      t.integer :size

      t.timestamps
    end
  end
end
