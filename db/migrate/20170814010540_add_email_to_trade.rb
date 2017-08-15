class AddEmailToTrade < ActiveRecord::Migration[5.1]
  def change
    add_column("trades", "offerer_email", :string)
    add_column("trades", "offeree_email", :string)
  end
end
