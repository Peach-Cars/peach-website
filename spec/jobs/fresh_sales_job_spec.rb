RSpec.describe "FreshSalesJob", type: :job do
  let(:contact_payload) do
    {
      "contact" => {
        "first_name" => 'John',
        "last_name" => 'Doe',
        "email" => 'john.doe@example.com',
        "mobile_number" => '0768978878',
        "custom_field" => {
          "cf_type" => 'Individual',
          "cf_location_of_residence" => 'Nairobi'
        },
        "lead_source_id" => 22_000_369_921
      }
    }
  end

  let(:listing_payload) do
    {
      "product" => {
        "name" => 'KBB123',
        "category" => 'Hatchback',
        "product_code" => 'TOYOTA',
        "sku_number" => 'Noah',
        "custom_field" => {
          "cf_year" => '2020',
          "cf_4_wheel_drive" => 'Yes',
          "cf_gearbox_type" => 'Manual',
          "cf_fuel_type" => 'Petrol'
        }
      }
    }
  end

  before do
    fresh_sales_service_instance = instance_double(FreshSalesService)
    allow(FreshSalesService).to receive(:new).and_return(fresh_sales_service_instance)
    allow(fresh_sales_service_instance).to receive(:create_contact).and_return(true)
    allow(fresh_sales_service_instance).to receive(:create_listing).and_return(true)
  end

  context 'when enqueuing jobs' do
    it 'enqueues a contact creation job' do
      expect do
        FreshSalesJob.perform_async('create_contact', contact_payload)
      end.to change(FreshSalesJob.jobs, :size).by(1)
    end

    it 'enqueues a listing creation job' do
      expect do
        FreshSalesJob.perform_async('create_listing', listing_payload)
      end.to change(FreshSalesJob.jobs, :size).by(1)
    end
  end
end
