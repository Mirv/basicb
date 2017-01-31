class CreateCampcounts < ActiveRecord::Migration[5.0]
  def change
    create_table :campcounts do |t|
      t.references :campaign, foreign_key: true
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
