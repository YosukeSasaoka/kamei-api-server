class SpecialUser < ApplicationRecord
  has_and_belongs_to_many :geolocations, :join_table => 'special_users_geolocations'
  belongs_to :user, class_name: 'User', :foreign_key => 'user_id'
  belongs_to :related_user, class_name: 'User', :foreign_key => 'related_user_id'
  
  def is_disguising?
    disguising
  end

end