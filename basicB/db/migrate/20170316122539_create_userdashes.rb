class CreateUserdashes < ActiveRecord::Migration[5.0]
  def change
    create_table :userdashes do |t|
      t.references :User, foreign_key: true
      t.references :Dash, foreign_key: true

      t.timestamps
    end
  end
end
