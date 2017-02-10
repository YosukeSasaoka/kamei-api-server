class SpecialUser < ApplicationRecord
  has_and_belongs_to_many :geolocations
end