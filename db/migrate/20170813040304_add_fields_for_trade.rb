class AddFieldsForTrade < ActiveRecord::Migration[5.1]
  def change
    add_column("trades", "transDirection", :string, :limit => 50)
    add_column("trades", "iso", :string, :limit => 10)
    add_column("trades", "loc", :string, :limit => 10)
    add_column("trades", "settlement", :string, :limit => 30)
    add_column("trades", "product", :string, :limit => 30)
    add_column("trades", "start_date", :date)
    add_column("trades", "end_date", :date)
    add_column("trades", "mw_peak", :string, :limit => 30)
    add_column("trades", "mw_wrap", :string, :limit => 30)
    

  end
end
