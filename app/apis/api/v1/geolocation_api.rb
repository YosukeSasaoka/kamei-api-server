# coding: utf-8

module API
  module V1
    class GeolocationApi < Grape::API
      # http://localhost:3000/api/v1/geolocations/
      resources :geolocations do

        # http://localhost:3000/api/v1/geolocations/mine
        desc 'show geolocation of requester own'
        params do
        end
        get '/mine' do
          authenticate!
          
          geolocation = @current_user.geolocations.select("latitude, longitude").latest
          
          geolocations = [{
            name: @current_user.name,
            latitude: geolocation.latitude,
            longitude: geolocation.longitude
          }]

          if @current_user.is_special?
            sp_users = SpecialUser.where(user_id: @current_user.id).where(disguising: true)
            sp_users.each do |sp_user|
              geolocation = sp_user.geolocations.select("latitude, longitude").current.latest
              geolocations.concat([
                {
                  name: @current_user.name + '(For ' +  User.find_by_id(sp_user.related_user_id).name + ')',
                  latitude: geolocation.latitude,
                  longitude: geolocation.longitude
                }])
            end
          end
          
          geolocations
        end

        # http://localhost:3000/api/v1/geolocations/other
        desc 'show geolocation of other user'
        params do
        end
        
        get '/other' do
          authenticate!
          
          geolocations = []
          
          if @current_user.is_special?
            special_users = @current_user.special_users
            special_users.each do |special_user|
              related_user = special_user.related_user
              geolocation = related_user.geolocations.select("latitude, longitude").latest
              geolocations.concat([
                {
                  name: related_user.name,
                  latitude: geolocation.latitude,
                  longitude: geolocation.longitude
                }])
            end
          else
            special_user = @current_user.related_users.first
            if special_user.is_disguising?
              geolocation = special_user.geolocations.select("latitude, longitude").current.latest
            else
              geolocation = special_user.user.geolocations.select("latitude, longitude").latest
            end
            geolocations.concat([
              {
                name: special_user.user.name,
                latitude: geolocation.latitude,
                longitude: geolocation.longitude
              }])
          end
          
          geolocations
        end

        # http://localhost:3000/api/v1/geolocations
        desc 'create geolocation'
        params do
          requires :latitude, type: Float, desc: 'Latitude'
          requires :longitude, type: Float, desc: 'Longitude'
        end
        post do
          authenticate!
          
          @current_user.geolocations.create( latitude: params[:latitude],
                                             longitude: params[:longitude],
                                             fetch_time: DateTime.now)
          { message: 'Geolocation successfully created' }
        end
      end        
    end
  end
end
