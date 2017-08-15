class AddUserColumnsToTrade < ActiveRecord::Migration[5.1]
  def change
    add_column("trades", "offerer_id", :integer)
    add_column("trades", "offeree_id", :integer)
  end
end
