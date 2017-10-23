require 'csv'

class DataPoint < ApplicationRecord
  has_many :chart_data_points
  has_many :charts, through: :chart_data_points

  def self.fill_in_table
    file_path = File.expand_path("db/other/data_points.csv")
    file = File.read(file_path)
    csv_file = CSV.parse(file)
    csv_file.each do |data_point|
      DataPoint.create(name: data_point[0], ysymbol: data_point[1])
    end
  end
end
