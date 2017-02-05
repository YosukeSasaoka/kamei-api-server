class CreateSpecialUserGeolocations < ActiveRecord::Migration[5.0]
  def change
    create_table :special_user_geolocations do |t|
      t.references :special_user, index: true, null: false
      t.references :geolocation, index: true, null: false
    end
  end
end
