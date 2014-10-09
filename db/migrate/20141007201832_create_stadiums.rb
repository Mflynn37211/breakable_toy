class CreateStadiums < ActiveRecord::Migration
  def change
      create_table :stadiums do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :capacity, null: false
      t.string :playing_surface, null: false
      t.string :roof_type, null: false
      t.string :team, null: false
      t.string :photo
      t.string :seating_chart
      t.text :description
      t.integer :year, null: false
    end
  end
end
