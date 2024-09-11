# Vehicle legacy model
module Legacy
  class Model < ApplicationRecord
    self.table_name = "vehicle_model"
    has_many :vehicles, class_name: 'Legacy::Vehicle', foreign_key: 'model_id'
    belongs_to :make, class_name: 'Legacy::Make', foreign_key: 'make_id'
  end
end
