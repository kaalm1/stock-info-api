class CreateDataPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :data_points do |t|
      t.string :name
      t.string :ysymbol
      t.timestamps
    end

    DataPoint.fill_in_table
  end
end
