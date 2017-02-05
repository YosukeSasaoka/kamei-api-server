# coding: utf-8

module API
  module V1
    class GeolocationApi < Grape::API
      # http://localhost:3000/api/v1/geolocations/
      resources :geolocations do

        # http://localhost:3000/api/v1/geolocations
        desc 'create geolocation'
        params do
          requires :latitude, type: BigDecimal, desc: 'Latitude'
          requires :longitude, type: BigDecimal, desc: 'Longitude'
        end
        post do
          authenticate!
          
          geolocation = Geolocation.new( latitude: params[:latitude],
                                         longitude: params[:longitude],
                                         fetch_time: DateTime.now)
          geolocation.save!
          
          { message: 'Geolocation successfully created' }
        end
      end        
    end
  end
end
