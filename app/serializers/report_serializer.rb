class ReportSerializer < ActiveModel::Serializer

  attributes :id, :authencity, :user_id, :report_date, :report_text, :removed_date, :is_removed,
              :longitude, :latitude, :removed_by, :school_id, :video, :voice_message, :created_at,
              :updated_at, :photos, :school, :user, :report_address, :comments


  def photos
    object.photos
  end

  def school
    object.school
  end

  def user
    object.user
  end

  def report_address
    object.longitude ?
        (lat_long = object.latitude.to_s + ',' + object.longitude.to_s
        parse_address = Geocoder.search(lat_long).first.address.split(',')
        parse_address[0] + ', '+ parse_address[2])
      : 'not found report address'
  end

  def comments
    object.comments
  end
end
