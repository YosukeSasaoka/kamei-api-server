class RemoveUserIdFromGeolocations < ActiveRecord::Migration[5.0]
  def change
    remove_column :geolocations, :user_id, :string
  end
end
