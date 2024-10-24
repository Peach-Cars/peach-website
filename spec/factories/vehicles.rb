# spec/factories/legacy_vehicles.rb
FactoryBot.define do

    factory :legacy_vehicle, class: 'Legacy::Vehicle' do
      id { nil } # or leave this out if it's auto-generated
      created { Time.now }
      modified { Time.now }
      name { 'Sample Vehicle' }
      color { 'Red' }
      registration_number { 'ABC123' }
      registration_format { 'XYZ123' }
      year_of_manufacture { '2022' }
      current_owner_id { nil }
      asking_price { 25000.00 }
      current_location { 'Sample Location' }
      current_mileage { 10000 }
      current_owner_phone { '1234567890' }
      drive { 'A' }
      engine_cc { 2000 }
      fuel_type { 'P' }
      google_maps_pin { 'https://maps.google.com/sample' }
      has_had_accident { false }
      has_sunroof { true }
      seats_number { 5 }
      body_type { 'SUV' }
      chasis_frame { 'ABC123' }
      duty_status { 'New' }
      engine_number { 'ENG123456' }
      has_abs { true }
      has_airbags { true }
      has_cruise_control { true }
      has_diff_lock { false }
      has_emergency_tyre { true }
      has_fire_extinguisher { true }
      has_fuel_economy { true }
      has_jack { true }
      has_life_saver { false }
      has_low_gear { false }
      has_power_steering { true }
      has_puncture_repair_kit { true }
      has_push_to_start { true }
      has_remote_lock { true }
      maximum_number_of_seats { 7 }
      number_of_doors { 4 }
      number_of_ideal_passengers { 5 }
      resell_value_status { 'High' }
      transmission { 'A' }
      used_status { 'Used' }
      has_air_conditioning { true }
      has_amplifier { false }
      has_arm_rest { true }
      has_aux { true }
      has_bluetooth { true }
      has_bullbar { false }
      has_cd { true }
      has_cup_holders { true }
      has_display { true }
      has_dvd { false }
      has_fm_am { true }
      has_fog_lights { true }
      has_height_control { false }
      has_rear_camera { true }
      has_roof_rack { false }
      has_roof_rails { true }
      has_safari_hatch { false }
      has_slide_door { true }
      has_snorkel { false }
      has_spoiler { true }
      has_usb { true }
      has_winch { false }
      frame_type { 'FR' }
      model_id { nil }
      model_code { 'MOD123' }
      current_owner_email { 'owner@example.com' }
      other_color { 'Blue' }
      seats { '5' }
      cover_image_id { nil }
      has_turbo { false }
      old_slug { 'old-slug' }
      dynamic_summary_hash { 'hash-value' }
      sharable_images { 'image-id' }
      customer_type { 'P' }
      sourced_from { 'SD' }
      registration_number_available { true }
      duplicate_to { nil }
      original { true }
      trim_id { nil }
      slug { 'vehicle-slug' }
      seller_source { 'P' }
    end
  end
  