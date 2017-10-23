class ChartDataPoint < ApplicationRecord
  belongs_to :chart
  belongs_to :data_point
end
