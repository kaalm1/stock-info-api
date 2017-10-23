class CreateStructures < ActiveRecord::Migration[5.1]
  def change
    create_table :structures do |t|
      t.string :name

      t.timestamps
    end

    Structure.create(name: 'MLP')
    Structure.create(name: 'REIT')
    Structure.create(name: 'Corp.')
  end
end
