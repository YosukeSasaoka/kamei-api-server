class CreateUsersGeolocations < ActiveRecord::Migration[5.0]
  def change
    create_table :users_geolocations, id: false do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.references :geolocation, foreign_key: true, index: true, null: false
    end
  end
end
