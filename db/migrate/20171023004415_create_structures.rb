class CreateStructures < ActiveRecord::Migration[5.1]
  def change
    create_table :structures do |t|
      t.string :name

      t.timestamps
    end

    Structure.fill_in_table
  end
end
