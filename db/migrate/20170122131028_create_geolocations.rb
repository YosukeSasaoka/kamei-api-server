class CreateGeolocations < ActiveRecord::Migration[5.0]
  def change
    create_table :geolocations do |t|
      t.references :user, null: false
      t.decimal :latitude, precision: 11, scale: 8, null: false
      t.decimal :longitude, precision: 11, scale: 8, null: false
      t.timestamp :fetch_time, null: false

      t.timestamps null: false
    end
  end
end
