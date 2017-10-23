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
    csv_file = CSV.parse(RestClient.get(url), {headers: true})

    keys = self.data_points.pluck(:name)
    all_stocks = csv_file.map do |stock|
      hash = {}
      keys.each_with_index do |key, index|
        if numeric?(stock[index])
          hash[key] = stock[index].to_f
        else
          hash[key] = stock[index].to_s
        end
      end
      hash["Percent Low"] = (((stock[4].to_f / stock[8].to_f) - 1)*100).round(1)
      hash
    end
    all_stocks
  end

  def self.create_favorites
    chart = Chart.create(name: 'Favorites')
    chart.stocks << Stock.where(favorite:true)
    chart.data_points << DataPoint.all
  end
end
