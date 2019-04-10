class ReportSerializer < ActiveModel::Serializer
  attributes :id, :authencity, :user_id, :report_date, :report_text, :removed_date, :is_removed,
              :longitude, :latitude, :removed_by, :school_id, :video, :voice_message, :created_at,
              :updated_at, :photos, :school, :user


  def photos
    object.photos
  end

  def school
    object.school
  end

  def user
    object.user
  end
end
