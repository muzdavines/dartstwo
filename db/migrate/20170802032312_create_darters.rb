class CreateDarters < ActiveRecord::Migration[5.1]
  def up
    create_table :darters do |t|
      t.integer "player_id"
      t.string "name"
      t.integer "seed"
      t.boolean "alive"
      t.integer "rounds"
      t.integer "total_points"
      t.timestamps
    end
    add_index("darters", "player_id")
  end
  def down
    drop_table :tournaments
  end
end
