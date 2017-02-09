class CreateUserplays < ActiveRecord::Migration[5.0]
  def change
    create_table :userplays do |t|
      t.references :campaign, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
