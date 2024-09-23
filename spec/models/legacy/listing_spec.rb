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

  describe 'Filtering listings by selling price' do
    it 'fetches all listings with a selling price below 500,000' do
      filtered_listings = Legacy::Listing.where('selling_price < ?', 500_000)
      expect(filtered_listings).not_to be_nil
      expect(filtered_listings.count).to be >= 0
      expect(filtered_listings.all? { |listing| listing.selling_price < 500_000 }).to be true
    end
  end

  describe 'Filtering listings by body type' do
    it 'fetches all listings with body type as SLN' do
      # Use the association to join vehicles and filter by body type
      filtered_listings = Legacy::Listing.joins(:vehicle).where(vehicle_vehicle: { body_type: 'SLN' })
      expect(filtered_listings).not_to be_nil
      expect(filtered_listings.count).to be >= 0
      expect(filtered_listings.all? { |listing| listing.vehicle.body_type == 'SLN' }).to be true
    end
  end

  describe 'Filtering listings by year of manufacture' do
    it 'fetches all listings where vehicle year of manufacture is 2017' do
      filtered_listings = Legacy::Listing.joins(:vehicle)
                                         .where(vehicle_vehicle: { year_of_manufacture: '2017' })
      expect(filtered_listings).not_to be_nil
      expect(filtered_listings.count).to be >= 0
      expect(filtered_listings.all? { |listing| listing.vehicle.year_of_manufacture == '2017' }).to be true
    end
  end

  describe 'Filtering listings by fuel type' do
    it "fetches all listings where vehicle's fuel type is petrol ('P')" do
      filtered_listings = Legacy::Listing.joins(:vehicle)
                                         .where(vehicle_vehicle: { fuel_type: 'P' })
      expect(filtered_listings).not_to be_nil
      expect(filtered_listings.count).to be >= 0
      expect(filtered_listings.all? { |listing| listing.vehicle.fuel_type == 'P' }).to be true
    end
  end

  describe 'Filtering listings by drive type' do
    it "fetches all listings where vehicle's drive type is '2'" do
      filtered_listings = Legacy::Listing.joins(:vehicle)
                                         .where(vehicle_vehicle: { drive: '2' })
      expect(filtered_listings).not_to be_nil
      expect(filtered_listings.count).to be >= 0
      expect(filtered_listings.all? { |listing| listing.vehicle.drive == '2' }).to be true
    end
  end

  describe 'Filtering listings by transmission type' do
    it "fetches all listings where vehicle's transmission type is 'A'" do
      filtered_listings = Legacy::Listing.joins(:vehicle).where(vehicle_vehicle: { transmission: 'A' })
      expect(filtered_listings).not_to be_nil
      expect(filtered_listings.count).to be >= 0
      expect(filtered_listings.all? { |listing| listing.vehicle.transmission == 'A' }).to be true
    end
  end

  describe 'Filtering listings by engine capacity' do
    it "fetches all listings where vehicle's engine capacity is below 2000cc" do
      filtered_listings = Legacy::Listing.joins(:vehicle).where('vehicle_vehicle.engine_cc < ?', 2000)
      expect(filtered_listings).not_to be_nil
      expect(filtered_listings.count).to be >= 0
      expect(filtered_listings.all? { |listing| listing.vehicle.engine_cc < 2000 }).to be true
    end
  end

  describe 'Fetching listings with deal tag' do
    it 'fetches all listings with the deal tag (id: 2) using joins and where' do
      deal_listings = Legacy::Listing.joins(:tags).where(tags: { id: 2 })
      expect(deal_listings).not_to be_nil
      expect(deal_listings.count).to be >= 0
      expect(deal_listings.all? { |listing| listing.tags.pluck(:id).include?(2) }).to be true
    end
  end

  describe 'Filtering listings by model' do
    it 'fetches all listings with vehicles of model (id: 30)' do
      model_id = 30
      listings_with_model = Legacy::Listing.joins(:vehicle).where(vehicle_vehicle: { model_id: })

      expect(listings_with_model).not_to be_nil
      expect(listings_with_model.count).to be >= 0
      expect(listings_with_model.all? { |listing| listing.vehicle.model_id == model_id }).to be true
    end
  end

  describe 'Filtering listings by make' do
    it 'fetches all listings with vehicles of make (id: 20)' do
      make_id = 20
      listings_with_make = Legacy::Listing.joins(vehicle: { model: :make }).where(vehicle_model: { make_id: })

      expect(listings_with_make).not_to be_nil
      expect(listings_with_make.count).to be >= 0
      expect(listings_with_make.all? { |listing| listing.vehicle.model.make_id == make_id }).to be true
    end
  end
end
