class CreateTournaments < ActiveRecord::Migration[5.1]
  def up
    create_table :tournaments do |t|
      t.string "name"
      t.date "date"
      t.string "fantasy_winner"
      t.string "darts_winner"
      t.timestamps
    end
  end
  def down
    drop_table :subjects
  end
end
