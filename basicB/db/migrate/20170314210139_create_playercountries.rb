class CreatePlayercountries < ActiveRecord::Migration[5.0]
  def change
    create_table :playercountries do |t|
      t.references :Country, foreign_key: true
      t.references :Player, foreign_key: true

      t.timestamps
    end
  end
end
