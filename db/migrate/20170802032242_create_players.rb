class CreatePlayers < ActiveRecord::Migration[5.1]
  def up
    create_table :players do |t|
      t.integer "tournament_id"
      t.string "name"
      t.integer "total_points", :default => 0
      t.timestamps
    end
    add_index("players", "tournament_id")
  end
    def down
      drop_table :tournaments
    end
end
