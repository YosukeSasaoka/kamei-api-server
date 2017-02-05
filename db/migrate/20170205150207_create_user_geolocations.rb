class CreateUserGeolocations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_geolocations do |t|
      t.references :user, index: true, null: false
      t.references :geolocation, index: true, null: false
    end
  end
end
