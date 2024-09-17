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
RSpec.describe "BuyerLead", type: :model do
  before do
    stub_request(:post, "https://peach-team.myfreshworks.com/crm/sales/api/contacts")
      .to_return(
        status: 200,
        body: { success: true }.to_json, 
        headers: { 'Content-Type' => 'application/json' }
      )
  end

  let(:listing) { Legacy::Listing.find_by(id: 2106) }

  context 'validations' do
    it 'is valid with all required attributes' do
      buyer_lead = BuyerLead.new(
        listing_id: listing.id,
        requested_financing: true,
        lead_source: 'test_source',
        full_name: 'John Doe',
        email: 'john.doe@example.com',
        phone: '123-456-7890'
      )
      expect(buyer_lead).to be_valid
    end

    it 'is not valid without a listing_id' do
      buyer_lead = BuyerLead.new(
        requested_financing: true,
        lead_source: 'test_source',
        full_name: 'John Doe',
        email: 'john.doe@example.com',
        phone: '123-456-7890'
      )
      expect(buyer_lead).not_to be_valid
    end

    it 'is not valid without a requested_financing' do
      buyer_lead = BuyerLead.new(
        listing_id: listing.id,
        lead_source: 'test_source',
        full_name: 'John Doe',
        email: 'john.doe@example.com',
        phone: '123-456-7890'
      )
      expect(buyer_lead).not_to be_valid
    end

    it 'is not valid without a lead_source' do
      buyer_lead = BuyerLead.new(
        listing_id: listing.id,
        requested_financing: true,
        full_name: 'John Doe',
        email: 'john.doe@example.com',
        phone: '123-456-7890'
      )
      expect(buyer_lead).not_to be_valid
    end
  end

  context 'callbacks' do
    it 'enqueues a FreshSalesJob after save' do
      expect do
        BuyerLead.create!(
          listing_id: listing.id,
          requested_financing: true,
          lead_source: 'test_source',
          full_name: 'John Doe',
          email: 'john.doe@example.com',
          phone: '123-456-7890'
        )
      end.to change(FreshSalesJob.jobs, :size).by(1)
    end

    it 'does not enqueue a job if pushed_to_fresh_sales is true' do
      buyer_lead = BuyerLead.create!(
        listing_id: listing.id,
        requested_financing: true,
        lead_source: 'test_source',
        full_name: 'John Doe',
        email: 'john.doe@example.com',
        phone: '123-456-7890',
        sent_to_freshsales: true
      )
      expect do
        buyer_lead.save
      end.not_to change(FreshSalesJob.jobs, :size)
    end
  end

  context 'job processing' do
    it 'processes the job and updates the sent_to_freshsales field' do
      buyer_lead = BuyerLead.create!(
        listing_id: listing.id,
        requested_financing: true,
        lead_source: 'test_source',
        full_name: 'John Doe',
        email: 'john.doe@example.com',
        phone: '123-456-7890'
      )
      FreshSalesJob.new.perform('create_contact', buyer_lead.send(:freshsales_payload), buyer_lead.id)

      buyer_lead.reload
      expect(buyer_lead.sent_to_freshsales).to be_truthy
    end
  end
end
