class ChartsController < ApplicationController
  def favorites
    chart = Chart.find_by(name: 'Favorites')
    render json: chart.create_chart.as_json
  end

  def chart_header
    chart = Chart.find_by(name: 'Favorites')
    headers = chart.data_points.pluck(:name)
    render json: {headers: headers}
  end
end
