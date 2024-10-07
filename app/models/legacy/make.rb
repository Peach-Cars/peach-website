# == Schema Information
#
# Table name: vehicle_make
#
#  id          :bigint           not null, primary key
#  created     :timestamptz      not null
#  modified    :timestamptz      not null
#  name        :string(45)       not null
#  description :text
#  slug        :string(50)       not null
#  is_active   :boolean          not null
#  logo        :string(100)
#
module Legacy
  class Make < ApplicationRecord
    self.table_name = "vehicle_make"
    has_many :models, class_name: 'Legacy::Model', foreign_key: 'make_id'
  end
end
