class CreateChartDataPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :chart_data_points do |t|
      t.integer :chart_id
      t.integer :data_point_id
      t.timestamps
    end
  end
end
