class CreateUsercamps < ActiveRecord::Migration[5.0]
  def change
    create_table :usercamps do |t|
      t.references :campaign, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
