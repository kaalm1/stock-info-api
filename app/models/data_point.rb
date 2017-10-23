class DataPoint < ApplicationRecord
  has_many :chart_data_points
  has_many :charts, through: :chart_data_points
end
