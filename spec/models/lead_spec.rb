# == Schema Information
#
# Table name: leads
#
#  id                  :bigint           not null, primary key
#  full_name           :string
#  email               :string
#  phone               :string
#  type                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  registration_number :string
#  model_id            :integer
#  year_of_manufacture :integer
#  asking_price        :decimal(, )
#  mileage             :integer
#  location            :string
#  listing_id          :integer
#  requested_financing :boolean
#  lead_source         :string
#  consent             :boolean          default(FALSE), not null
#  sent_to_freshsales  :boolean
#  sent_to_django_api  :boolean
#
require 'rails_helper'

RSpec.describe Lead, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
