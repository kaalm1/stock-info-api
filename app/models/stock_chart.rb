class StockChart < ApplicationRecord
  belongs_to :stock
  belongs_to :chart
end
