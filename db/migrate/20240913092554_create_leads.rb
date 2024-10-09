class CreateLeads < ActiveRecord::Migration[7.2]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :type

      t.timestamps
    end
  end
end
