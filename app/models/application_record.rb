class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def numeric?(obj)
    Float(obj) != nil rescue false
  end
end
