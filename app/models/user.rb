class User < ApplicationRecord
  has_many :api_keys, dependent: :destroy
  has_and_belongs_to_many :geolocations, :join_table => 'users_geolocations'
  has_many :special_users, class_name: 'SpecialUser', :foreign_key => 'user_id'
  has_many :related_users, class_name: 'SpecialUser', :foreign_key => 'related_user_id'

  def update_name!(new_name)
    return if self.name == new_name
    self.name = new_name
    self.save!
  end
  
  def is_special?
    SpecialUser.exists?(user_id: id)
  end
  
end
