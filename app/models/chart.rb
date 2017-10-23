class Chart < ApplicationRecord
  has_many :stock_charts
  has_many :stocks, through: :stock_charts

  has_many :chart_data_points
  has_many :data_points, through: :chart_data_points
end
