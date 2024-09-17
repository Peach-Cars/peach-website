# == Schema Information
#
# Table name: vehicle_vehicle
#
#  id                            :bigint           not null, primary key
#  created                       :timestamptz      not null
#  modified                      :timestamptz      not null
#  name                          :string(45)
#  color                         :string(10)
#  registration_number           :string(45)
#  registration_format           :string(45)
#  year_of_manufacture           :string(45)
#  current_owner_id              :bigint
#  asking_price                  :float
#  current_location              :string(300)
#  current_mileage               :integer
#  current_owner_phone           :string(30)
#  drive                         :string(1)
#  engine_cc                     :integer
#  fuel_type                     :string(3)
#  google_maps_pin               :string(200)
#  has_had_accident              :boolean
#  has_sunroof                   :boolean
#  seats_number                  :integer
#  body_type                     :string(5)
#  chasis_frame                  :string(45)
#  duty_status                   :string(4)
#  engine_number                 :string(45)
#  has_abs                       :boolean
#  has_airbags                   :boolean
#  has_cruise_control            :boolean
#  has_diff_lock                 :boolean
#  has_emergency_tyre            :boolean
#  has_fire_extinguisher         :boolean
#  has_fuel_economy              :boolean
#  has_jack                      :boolean
#  has_life_saver                :boolean
#  has_low_gear                  :boolean
#  has_power_steering            :boolean
#  has_puncture_repair_kit       :boolean
#  has_push_to_start             :boolean
#  has_remote_lock               :boolean
#  maximum_number_of_seats       :integer
#  number_of_doors               :integer
#  number_of_ideal_passengers    :integer
#  resell_value_status           :string(4)
#  transmission                  :string(3)
#  used_status                   :string(4)
#  has_air_conditioning          :boolean
#  has_amplifier                 :boolean
#  has_arm_rest                  :boolean
#  has_aux                       :boolean
#  has_bluetooth                 :boolean
#  has_bullbar                   :boolean
#  has_cd                        :boolean
#  has_cup_holders               :boolean
#  has_display                   :boolean
#  has_dvd                       :boolean
#  has_fm_am                     :boolean
#  has_fog_lights                :boolean
#  has_height_control            :boolean
#  has_rear_camera               :boolean
#  has_roof_rack                 :boolean
#  has_roof_rails                :boolean
#  has_safari_hatch              :boolean
#  has_slide_door                :boolean
#  has_snorkel                   :boolean
#  has_spoiler                   :boolean
#  has_usb                       :boolean
#  has_winch                     :boolean
#  frame_type                    :string(2)
#  model_id                      :bigint
#  model_code                    :string(45)
#  current_owner_email           :string(254)
#  other_color                   :string(45)
#  seats                         :string(2)
#  cover_image_id                :bigint
#  has_turbo                     :boolean
#  old_slug                      :string(100)
#  dynamic_summary_hash          :string(255)
#  sharable_images               :string(20)
#  customer_type                 :string(4)
#  sourced_from                  :string(5)        not null
#  registration_number_available :boolean
#  duplicate_to                  :integer
#  original                      :boolean          not null
#  trim_id                       :bigint
#  slug                          :string(100)
#  seller_source                 :string(20)
#
# Vehicle legacy model
module Legacy
  class Vehicle < ApplicationRecord
    self.table_name = "vehicle_vehicle"
    has_many :listings, class_name: 'Legacy::Listing', foreign_key: 'vehicle_id'
  end
end
