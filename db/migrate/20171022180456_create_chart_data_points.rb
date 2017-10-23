class CreateChartDataPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :chart_data_points do |t|

      t.timestamps
    end
  end
end
