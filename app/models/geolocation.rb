class Geolocation < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => 'users_geolocations'
  has_and_belongs_to_many :special_users, :join_table => 'special_users_geolocations'
end
