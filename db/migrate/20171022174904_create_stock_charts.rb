class CreateStockCharts < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_charts do |t|
      t.integer :stock_id
      t.integer :chart_id
      
      t.timestamps
    end
  end
end
