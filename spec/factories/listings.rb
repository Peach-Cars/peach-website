FactoryBot.define do
  factory :legacy_listing, class: 'Legacy::Listing' do
    vehicle { create(:legacy_vehicle) }
    listing_relationship_manager { create(:relationship_manager) }
    listing_location { create(:location) }
    selling_price { 25_000.00 }
    active { true }
    description { 'Sample description for the listing.' }
    grade { 'A' }
    logbook_info_confirmed { true }
    seller_verified { true }
    title { 'Sample Listing Title' }
    viewing_at_hq_available { true }
    accident_free { true }
    inspected_by_peach { true }
    inspection_report_available { true }
    mileage_verified_genuine { true }
    cover_image_id { nil } # Assuming no cover image for the factory, adjust as needed
    basic_features { 'Basic features of the vehicle.' }
    driving_specs { 'Driving specifications.' }
    interior_exterior { 'Interior and exterior details.' }
    mileage { 15_000 }
    sourced_from { 'USA' }
    peach_assurance { 'Peach Assurance details.' }
    meta_description { 'Meta description for the listing.' }
    meta_keywords { 'keyword1, keyword2' }
    current_status_id { nil } # Adjust as needed
    sales_person_id { nil } # Adjust as needed
    humanized_sale_turn_around_time { '5 days' }
    seller_relation_manager_id { nil } # Adjust as needed
    listed_on { Time.now }

    created { Time.now }
    modified { Time.now }
  end
end
