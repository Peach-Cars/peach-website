# == Schema Information
#
# Table name: vehicle_vehiclelisting_tags
#
#  id                :integer          not null, primary key
#  vehiclelisting_id :bigint           not null
#  tag_id            :bigint           not null
#
require 'rails_helper'

RSpec.describe Legacy::ListingTag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end