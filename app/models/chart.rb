require 'csv'

class Chart < ApplicationRecord
  has_many :stock_charts
  has_many :stocks, through: :stock_charts

  has_many :chart_data_points
  has_many :data_points, through: :chart_data_points

  def create_chart
    stocks = self.stocks.pluck(:ticker).join('+')
    data_points = self.data_points.pluck(:ysymbol).join('')
    url = "http://finance.yahoo.com/d/quotes.csv?s=#{stocks}&f=#{data_points}"
    data = CSV.parse(RestClient.get(url), {headers: true})
    data.each do |stock|
      byebug
    end
  end

  def self.create_favorites
    chart = Chart.create(name: 'Favorites')
    chart.stocks << Stock.where(favorite:true)
    chart.data_points << DataPoint.all
  end
end
