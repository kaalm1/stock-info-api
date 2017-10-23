class CreateDataPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :data_points do |t|
      t.string :name
      t.string :ysymbol
      t.timestamps
    end
  end
end
