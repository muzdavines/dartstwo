class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.integer "darter_id"
      t.boolean "champion", :default => false
      t.boolean "win", :default => false
      t.integer "180", :default => 0
      t.integer "140", :default => 0
      t.integer "170", :default => 0
      t.integer "ton_plus", :default => 0
      t.integer "9_dart", :default => 0
      t.integer "legs", :default => 0
      t.integer "score", :default => 0
      t.string "name", :default => "Round 1"
      t.timestamps
    end
    add_index("rounds", "darter_id")
  end
  def down
    drop_table :tournaments
  end
end
