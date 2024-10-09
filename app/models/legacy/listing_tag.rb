# == Schema Information
#
# Table name: vehicle_vehiclelisting_tags
#
#  id                :integer          not null, primary key
#  vehiclelisting_id :bigint           not null
#  tag_id            :bigint           not null
#
module Legacy
  class ListingTag < ApplicationRecord
    self.table_name = "vehicle_vehiclelisting_tags"
    belongs_to :listing, class_name: "Legacy::Listing", foreign_key: "vehiclelisting_id"
    belongs_to :tag, class_name: "Legacy::Tag", foreign_key: 'tag_id'
  end
end
