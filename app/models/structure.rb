require 'csv'

class Structure < ApplicationRecord
  has_many :stocks

  def self.fill_in_table
    file_path = File.expand_path("db/other/structures.csv")
    file = File.read(file_path)
    csv_file = CSV.parse(file)
    csv_file.each do |structure|
      Structure.create(name: structure[0])
    end
  end
end
