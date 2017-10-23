require 'csv'

class Stock < ApplicationRecord
  has_many :stock_charts
  has_many :charts, through: :stock_charts

  belongs_to :structure
  belongs_to :category

  def self.fill_in_table
    file_path = File.expand_path("db/other/stocks.csv")
    file = File.read(file_path)
    csv_file = CSV.parse(file)
    csv_file.each do |stock|
      new_stock = Stock.new(ticker:stock[0], favorite:stock[4], sponsor:stock[5])
      Category.find_by(name:stock[2]).stocks << new_stock
      Structure.find_by(name:stock[3]).stocks << new_stock
      new_stock.save
    end
  end
end
