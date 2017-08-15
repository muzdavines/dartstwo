class CreateTradesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :trades_users, :id => false do |t|
      t.integer "user_id"
      t.integer "trade_id"
    end
    add_index("trades_users", ["user_id","trade_id"])
  end
end
