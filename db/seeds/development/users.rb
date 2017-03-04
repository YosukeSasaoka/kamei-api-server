def createTestUser!

  user = User.new
  user.uuid = "12345"
  user.name = "Taro"
  api_key = ApiKey.generate
  api_key.access_token = "Taro"
  user.api_keys << api_key
  user.save!

  user.geolocations.create( latitude: 33.560465,
                            longitude: 133.535672,
                            fetch_time: DateTime.now)
                            

  user = User.new
  user.uuid = "56789"
  user.name = "Hanako"
  api_key = ApiKey.generate
  api_key.access_token = "Hanako"
  user.api_keys << api_key
  user.save!

  user.geolocations.create( latitude: 33.561360,
                            longitude: 133.536691,
                            fetch_time: DateTime.now)

  user = User.new
  user.uuid = "90123"
  user.name = "Sachiko"
  api_key = ApiKey.generate
  api_key.access_token = "Sachiko"
  user.api_keys << api_key
  user.save!

  user.geolocations.create( latitude: 33.560134,
                            longitude: 133.540192,
                            fetch_time: DateTime.now)

  user = User.new
  user.uuid = "34567"
  user.name = "Mariko"
  api_key = ApiKey.generate
  api_key.access_token = "Mariko"
  user.api_keys << api_key
  user.save!

  user.geolocations.create( latitude: 33.560554,
                            longitude: 133.535516,
                            fetch_time: DateTime.now)

  sp_user = SpecialUser.new
  sp_user.user_id = User.find_by_name("Taro").id
  sp_user.related_user_id = User.find_by_name("Hanako").id
  sp_user.disguising = true
  sp_user.save!
  
  # 秋葉原 (過去)
  sp_user.geolocations.create( latitude: 35.698746,
                               longitude: 139.772602,
                               fetch_time: '2016-12-25 13:00:00')

  sp_user.geolocations.create( latitude: 33.563230,
                               longitude: 133.534586,
                               fetch_time: DateTime.now)

  # 吉祥寺 (未来)
  sp_user.geolocations.create( latitude: 35.703507,
                               longitude: 139.580156,
                               fetch_time: '2017-04-03 10:00:00')

  sp_user = SpecialUser.new
  sp_user.user_id = User.find_by_name("Taro").id
  sp_user.related_user_id = User.find_by_name("Sachiko").id
  sp_user.disguising = true
  sp_user.save!

  sp_user.geolocations.create( latitude: 33.558646,
                               longitude: 133.531630,
                               fetch_time: DateTime.now)


  sp_user = SpecialUser.new
  sp_user.user_id = User.find_by_name("Taro").id
  sp_user.related_user_id = User.find_by_name("Mariko").id
  sp_user.disguising = false
  sp_user.save!



end

def main

  createTestUser!()

end

main()