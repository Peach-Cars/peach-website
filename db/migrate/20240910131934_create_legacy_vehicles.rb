class CreateLegacyVehicles < ActiveRecord::Migration[7.2]
  def change
    create_table :legacy_vehicles do |t|
      t.timestamps
    end
  end
end
