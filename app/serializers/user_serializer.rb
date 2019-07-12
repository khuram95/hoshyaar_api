class UserSerializer < ActiveModel::Serializer
  attributes :id, :phone_number, :user_name, :address, :total_reports, :total_comments,
              :interested_school_count, :is_active

  def address
    'ok'
    # object.longitude != 0.0 && object.latitude != 0.0 ?
    #     (lat_long = object.latitude.to_s + ',' + object.longitude.to_s
    #     parse_address = Geocoder.search(lat_long).first.address.split(',')
    #     parse_address[0] + ', '+ parse_address[2])
    #   : 'not found report address'
  end

  def total_reports
    object.reports.count
  end

  def total_comments
    object.comments.count
  end

  def interested_school_count
    object.my_interests.count
  end
end