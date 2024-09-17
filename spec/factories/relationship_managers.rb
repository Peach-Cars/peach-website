FactoryBot.define do
  factory :relationship_manager, class: 'Legacy::ListingRelationshipManager' do
    password { 'password123' } # or use a secure password generator
    first_name { 'John' }
    last_name { 'Doe' }
    is_superuser { false }
    is_staff { true }
    is_active { true }
    date_joined { Time.current }
    last_activity { Time.current }
    created { Time.current }
    modified { Time.current }
    employment_role { 'Manager' }
    employment_status { 'Active' }
    original { true }
    last_login { nil }
    kc_id { '1234567890' }
    phone_number { '123-456-7890' }
    whatsapp_number { '123-456-7890' }
    heard_about_us { 1 } 
    how_to_help { 1 }    
    duplicate_to { nil }
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
  end
end
