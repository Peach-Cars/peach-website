RSpec.describe "FreshSalesJob", type: :job do
  let(:contact_payload) do
    {
      "contact" => {
        "first_name" => 'John',
        "last_name" => 'Doe',
        "email" => 'john.doe@example.com',
        "mobile_number" => '123-456-7890',
        "custom_field" => {
          "cf_type" => 'Individual',
          "cf_location_of_residence" => 'New York'
        },
        "lead_source_id" => 22_000_369_921
      }
    }
  end

  let(:listing_payload) do
    {
      "product" => {
        "name" => 'Sample Product',
        "description" => 'This is a sample product',
        "category" => 'Software',
        "is_active" => true,
        "parent_product" => 1,
        "product_code" => 'sample_product',
        "sku_number" => 'sample_sku',
        "valid_till" => '2021-11-06T13:47:13+05:00',
        "owner_id" => 3,
        "custom_field" => {
          "cf_rating" => 'Excellent',
          "cf_quantity" => 10
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

  context 'when performing jobs' do
    it 'executes create_contact with correct payload' do
      FreshSalesJob.perform_async('create_contact', contact_payload)
      FreshSalesJob.drain # Executes the queued job
      expect(FreshSalesService.new).to have_received(:create_contact).with(contact_payload)
    end

    it 'executes create_listing with correct payload' do
      FreshSalesJob.perform_async('create_listing', listing_payload)
      FreshSalesJob.drain # Executes the queued job
      expect(FreshSalesService.new).to have_received(:create_listing).with(listing_payload)
    end
  end
end
