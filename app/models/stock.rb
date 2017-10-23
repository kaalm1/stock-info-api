class Stock < ApplicationRecord
  has_many :stock_charts
  has_many :charts, through: stock_charts

  belongs_to :structure
  belongs_to :category
end
