class Datum < ApplicationRecord

  def self.retrieve
    url = "http://finance.yahoo.com/d/quotes.csv?s=#{stocks}&f=#{info_wanted}"
    CSV.parse(RestClient.get(url),headers=true)
  end
end
