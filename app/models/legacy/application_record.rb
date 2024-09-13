# Legacy namespace
module Legacy
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
    connects_to database: { reading: :legacy } 
  end
end
