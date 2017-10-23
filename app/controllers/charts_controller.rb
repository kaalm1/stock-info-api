class ChartsController < ApplicationController
  def favorites
    chart = Chart.find_by(name: 'Favorites')
    render json: chart.create_chart.as_json
  end

end
