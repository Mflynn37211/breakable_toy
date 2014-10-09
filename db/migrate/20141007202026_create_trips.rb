class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :user_id, null: false
      t.integer :stadium_id, null: false
      t.text :summary, null: false
      t.index :user_id
      t.index :stadium_id

      t.timestamps
    end
  end
end
