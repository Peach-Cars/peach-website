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
class BuyerLead < Lead
  after_save :enqueue_freshsales_job

  validates :listing_id, :requested_financing, :lead_source, presence: true
  belongs_to :listing, class_name: 'Legacy::Listing', foreign_key: 'listing_id'

  private

  def enqueue_freshsales_job
    return if sent_to_freshsales

    FreshSalesJob.perform_later('create_contact', freshsales_payload, id)
  end

  def freshsales_payload
    names = full_name.split(' ', 2)
    first_name = names.first || '_blank'
    last_name = names.second || '_blank'

    {
      "contact" => {
        "first_name" => first_name,
        "last_name" => last_name,
        "email" => email,
        "mobile_number" => phone,
        "custom_field" => {
          "cf_type" => 'Individual',
          "cf_location_of_residence" => location || '_blank'
        },
        "lead_source_id" => 22_000_369_921
      }
    }
  end
end
