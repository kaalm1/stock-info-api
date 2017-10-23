require 'csv'

class Category < ApplicationRecord
  has_many :stocks

  def self.fill_in_table
    file_path = File.expand_path("db/other/categories.csv")
    file = File.read(file_path)
    csv_file = CSV.parse(file)
    csv_file.each do |category|
      Category.create(name: category[0])
    end
  end
end
