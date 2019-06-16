class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :school_name, :report_id, :notification_text, :report_time

  def school_name
    object.report.school.school_name
  end
end