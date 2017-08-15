class CreateTradeviews < ActiveRecord::Migration[5.1]
  def change
    create_table :tradeviews do |t|

      t.timestamps
    end
  end
end
