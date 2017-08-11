class RoundDefaults < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:rounds, :champion, false)
    change_column_default(:rounds, :win, false)
    change_column_default(:rounds, "180", 0)
    change_column_default(:rounds, "140", 0)
    change_column_default(:rounds, "140", 0)
    change_column_default(:rounds, "170", 0)
    change_column_default(:rounds, "ton_plus", 0)
    change_column_default(:rounds, "9_dart", 0)
    change_column_default(:rounds, "legs", 0)
    change_column_default(:rounds, "score", 0)
  end
end
