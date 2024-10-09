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
require 'webmock/rspec'

RSpec.describe "SellerLead", type: :model do
  before do
    stub_request(:post, "https://peach-team.myfreshworks.com/crm/sales/api/contacts")
      .to_return(
        status: 200,
        body: { success: true }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )
  end

  context 'validations' do
    it 'is valid with all required attributes' do
      seller_lead = SellerLead.new(
        full_name: 'Jane Doe',
        email: 'brian@example.com',
        phone: '123-456-7890',
        registration_number: 'ABC123',
        model_id: 1,
        year_of_manufacture: 2020,
        asking_price: 15000.0,
        mileage: 50000,
        location: 'Nairobi',
        consent: true
      )
      expect(seller_lead).to be_valid
    end

    it 'is not valid without a registration_number' do
      seller_lead = SellerLead.new(
        full_name: 'Jane Doe',
        email: 'brian@example.com',
        phone: '076-456-7890',
        model_id: 1,
        year_of_manufacture: 2020,
        asking_price: 15000.0,
        mileage: 50000,
        location: 'Nairobi',
        consent: true
      )
      expect(seller_lead).not_to be_valid
    end

    it 'is not valid without a model_id' do
      seller_lead = SellerLead.new(
        full_name: 'Jane Doe',
        email: 'brian@example.com',
        phone: '123-456-7890',
        registration_number: 'ABC123',
        year_of_manufacture: 2020,
        asking_price: 15000.0,
        mileage: 50000,
        location: 'Nairobi',
        consent: true
      )
      expect(seller_lead).not_to be_valid
    end

    it 'is not valid without consent' do
      seller_lead = SellerLead.new(
        full_name: 'Jane Doe',
        email: 'brian@example.com',
        phone: '076-456-7890',
        registration_number: 'ABC123',
        model_id: 1,
        year_of_manufacture: 2020,
        asking_price: 150000.0,
        mileage: 50000,
        location: 'New York'
      )
      expect(seller_lead).not_to be_valid
    end
  end

  context 'callbacks' do
    it 'enqueues a FreshSalesJob after save' do
      expect do
        SellerLead.create!(
          full_name: 'Jane Doe',
          email: 'jane.doe@example.com',
          phone: '076-456-7890',
          registration_number: 'ABC123',
          model_id: 1,
          year_of_manufacture: 2020,
          asking_price: 15000.0,
          mileage: 50000,
          location: 'New York',
          consent: true
        )
      end.to have_enqueued_job(FreshSalesJob)
    end

    it 'does not enqueue a job if sent_to_freshsales is true' do
      seller_lead = SellerLead.create!(
        full_name: 'Brian Murithi',
        email: 'brian@example.com',
        phone: '076-456-7890',
        registration_number: 'ABC123',
        model_id: 1,
        year_of_manufacture: 2020,
        asking_price: 150000.0,
        mileage: 50000,
        location: 'Nairobi',
        consent: true,
        sent_to_freshsales: true
      )
      expect do
        seller_lead.save
      end.not_to have_enqueued_job(FreshSalesJob)
    end
  end

  context 'job processing' do
    it 'processes the job and updates the sent_to_freshsales field' do
      seller_lead = SellerLead.create!(
        full_name: 'Brian Murithi',
        email: 'brian@example.com',
        phone: '076-456-7890',
        registration_number: 'ABC123',
        model_id: 1,
        year_of_manufacture: 2020,
        asking_price: 15000.0,
        mileage: 50000,
        location: 'Nairobi',
        consent: true
      )
      FreshSalesJob.new.perform('create_contact', seller_lead.send(:freshsales_payload), seller_lead.id)

      seller_lead.reload
      expect(seller_lead.sent_to_freshsales).to be_truthy
    end
  end
end
