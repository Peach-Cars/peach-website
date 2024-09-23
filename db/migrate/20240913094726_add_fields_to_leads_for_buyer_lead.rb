class AddFieldsToLeadsForBuyerLead < ActiveRecord::Migration[7.2]
  def change
    add_column :leads, :listing_id, :integer
    add_column :leads, :requested_financing, :boolean
    add_column :leads, :lead_source, :string
  end
end
