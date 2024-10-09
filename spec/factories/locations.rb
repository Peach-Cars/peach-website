FactoryBot.define do
    factory :location, class: 'Legacy::ListingLocation' do
      # Add necessary attributes
      name { 'Sample Location' }
      created { Time.now }
      modified { Time.now }
      # Other attributes if needed
    end
  end