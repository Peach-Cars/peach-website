class AddSentFlagsToLeads < ActiveRecord::Migration[7.2]
  def change
    add_column :leads, :sent_to_freshsales, :boolean
    add_column :leads, :sent_to_django_api, :boolean
  end
end
