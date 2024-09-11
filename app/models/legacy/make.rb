# Vehicle legacy model
module Legacy
  class Make < ApplicationRecord
    self.table_name = "vehicle_make"
    has_many :models, class_name: 'Legacy::Model', foreign_key: 'make_id'
  end
end
