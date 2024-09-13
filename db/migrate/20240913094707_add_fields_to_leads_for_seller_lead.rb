class AddFieldsToLeadsForSellerLead < ActiveRecord::Migration[7.2]
  def change
    add_column :leads, :registration_number, :string
    add_column :leads, :model_id, :integer
    add_column :leads, :year_of_manufacture, :integer
    add_column :leads, :asking_price, :decimal
    add_column :leads, :mileage, :integer
    add_column :leads, :location, :string
  end
end
