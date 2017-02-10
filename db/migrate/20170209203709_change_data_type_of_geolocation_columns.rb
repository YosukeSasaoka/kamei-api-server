class ChangeDataTypeOfGeolocationColumns < ActiveRecord::Migration[5.0]
  def up
    change_column :geolocations, :latitude, :float
    change_column :geolocations, :longitude, :float
  end

  def down
    change_column :geolocations, :latitude, :decimal, precision: 11, scale: 8, null: false
    change_column :geolocations, :longitude, :decimal, precision: 11, scale: 8, null: false
  end
end
