class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :screenname
      t.string :motto
      t.references :country_id, foreign_key: true

      t.timestamps
    end
  end
end
