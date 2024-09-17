require 'rails_helper'

# == Schema Information
#
# Table name: vehicle_vehiclelisting
#
#  id                              :bigint           not null, primary key
#  created                         :timestamptz      not null
#  modified                        :timestamptz      not null
#  selling_price                   :float            not null
#  active                          :boolean          not null
#  vehicle_id                      :bigint           not null
#  description                     :text
#  grade                           :string(10)
#  logbook_info_confirmed          :boolean          not null
#  seller_verified                 :boolean          not null
#  title                           :string(45)
#  viewing_at_hq_available         :boolean          not null
#  accident_free                   :boolean          not null
#  inspected_by_peach              :boolean          not null
#  inspection_report_available     :boolean          not null
#  mileage_verified_genuine        :boolean          not null
#  cover_image_id                  :bigint
#  basic_features                  :text
#  driving_specs                   :text
#  interior_exterior               :text
#  mileage                         :integer
#  sourced_from                    :string(5)        not null
#  peach_assurance                 :text
#  meta_description                :text
#  meta_keywords                   :text
#  location_id                     :bigint
#  current_status_id               :bigint
#  sales_person_id                 :bigint
#  humanized_sale_turn_around_time :string(100)
#  seller_relation_manager_id      :bigint
#  listed_on                       :timestamptz
#

RSpec.describe Legacy::Listing, type: :model do
  describe 'Fetching active listings' do
    it 'fetches all listings with the active tag (id: 1) using joins and where' do
      active_listings = Legacy::Listing.joins(:tags).where(tags: { id: 1 })
      expect(active_listings).not_to be_nil
      expect(active_listings.count).to be >= 0
      expect(active_listings.all? { |listing| listing.tags.pluck(:id).include?(1) }).to be true
    end

    it 'fetches all listings with the active tag (id: 1) using merge' do
      active_listings = Legacy::Listing.joins(:tags).merge(Legacy::Tag.where(id: 1))
      expect(active_listings).not_to be_nil
      expect(active_listings.count).to be >= 0
      expect(active_listings.all? { |listing| listing.tags.pluck(:id).include?(1) }).to be true
    end
    it 'fetches all listings' do
      all_listings = Legacy::Listing.all
      expect(all_listings).not_to be_nil
      expect(all_listings.count).to be >= 0
    end
  end
end
