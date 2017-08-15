class AddLastColumnsToTrade < ActiveRecord::Migration[5.1]
  def change
    add_column("trades", "price_peak", :float)
    add_column("trades", "price_wrap", :float)
    add_column("trades", "term", :int)
  end
end
