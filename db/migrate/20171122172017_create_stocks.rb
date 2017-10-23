class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :sponsor
      t.boolean :favorite, default: false
      t.integer :category_id
      t.integer :structure_id

      t.timestamps
    end

    Stock.fill_in_table
  end
end
