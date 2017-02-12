def createTestUser!

  user = User.new
  user.uuid = "12345"
  user.name = "Taro"
  api_key = ApiKey.generate
  api_key.access_token = "test_token"
  user.api_keys << api_key
  user.save!

  # 渋谷  
  user.geolocations.create( latitude: 35.658987,
                            longitude: 139.700445,
                            fetch_time: DateTime.now)
                            

  user = User.new
  user.uuid = "56789"
  user.name = "Hanako"
  api_key = ApiKey.generate
  api_key.access_token = "test_token2"
  user.api_keys << api_key
  user.save!

  # 新宿
  user.geolocations.create( latitude: 35.692104,
                            longitude: 139.701236,
                            fetch_time: DateTime.now)

  user = User.new
  user.uuid = "90123"
  user.name = "Sachiko"
  api_key = ApiKey.generate
  api_key.access_token = "test_token3"
  user.api_keys << api_key
  user.save!

  # 大阪
  user.geolocations.create( latitude: 35.702392,
                            longitude: 135.497726,
                            fetch_time: DateTime.now)


  sp_user = SpecialUser.new
  sp_user.user_id = User.find_by_name("Taro").id
  sp_user.related_user_id = User.find_by_name("Hanako").id
  sp_user.disguising = false
  sp_user.save!
  
  # 秋葉原 (過去)
  sp_user.geolocations.create( latitude: 35.698746,
                               longitude: 139.772602,
                               fetch_time: '2016-12-25 13:00:00')

  # 池袋 (現在)
  sp_user.geolocations.create( latitude: 35.730030,
                               longitude: 139.708597,
                               fetch_time: DateTime.now)

  # 吉祥寺 (未来)
  sp_user.geolocations.create( latitude: 35.703507,
                               longitude: 139.580156,
                               fetch_time: '2017-03-03 10:00:00')

  sp_user = SpecialUser.new
  sp_user.user_id = User.find_by_name("Taro").id
  sp_user.related_user_id = User.find_by_name("Sachiko").id
  sp_user.disguising = false
  sp_user.save!

end

def main

  createTestUser!()

end

main()