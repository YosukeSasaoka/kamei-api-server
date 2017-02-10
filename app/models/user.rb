class User < ApplicationRecord
  has_many :api_keys, dependent: :destroy
  has_and_belongs_to_many :geolocations, :join_table => 'users_geolocations'

  def update_name!(new_name)
    return if self.name == new_name
    self.name = new_name
    self.save!
  end
end
