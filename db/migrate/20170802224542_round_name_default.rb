class RoundNameDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:rounds, "name", "Round 1")
  end
end
