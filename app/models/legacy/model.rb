# == Schema Information
#
# Table name: vehicle_model
#
#  id          :bigint           not null, primary key
#  created     :timestamptz      not null
#  modified    :timestamptz      not null
#  name        :string(45)       not null
#  description :text
#  slug        :string(50)       not null
#  is_active   :boolean          not null
#  make_id     :bigint           not null
#  logo        :string(100)
#
module Legacy
  class Model < ApplicationRecord
    self.table_name = "vehicle_model"
    has_many :vehicles, class_name: 'Legacy::Vehicle', foreign_key: 'model_id'
    belongs_to :make, class_name: 'Legacy::Make', foreign_key: 'make_id'
  end
end
