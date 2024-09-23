# == Schema Information
#
# Table name: users_user
#
#  id                :bigint           not null, primary key
#  password          :string(128)      not null
#  last_login        :timestamptz
#  is_superuser      :boolean          not null
#  username          :string(150)      not null
#  first_name        :string(150)      not null
#  last_name         :string(150)      not null
#  email             :string(254)      not null
#  is_staff          :boolean          not null
#  is_active         :boolean          not null
#  date_joined       :timestamptz      not null
#  last_activity     :timestamptz      not null
#  created           :timestamptz      not null
#  modified          :timestamptz      not null
#  kc_id             :string(60)
#  phone_number      :string(20)
#  whatsapp_number   :string(20)
#  heard_about_us    :integer
#  how_to_help       :integer
#  employment_role   :string(10)       not null
#  employment_status :string(20)       not null
#  duplicate_to      :integer
#  original          :boolean          not null
#
require 'rails_helper'

RSpec.describe Legacy::User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
