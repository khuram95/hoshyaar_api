class NotificationData
  def self.report_create(report_id, school)
    {
      report_id: report_id,
      notification_text: "A new report create in your region, #{school.school_name}, #{school.tehsil}, #{school.district}"
    }
  end

  # def self.package_received(package_id, package_title, host_name)
  #   {
  #     type: PACKAGE_RECEIVED,
  #     package_id: package_id,
  #     host_name: host_name,
  #     title: package_title,
  #     description: "Your package #{package_title} has been received."
  #   }
  # end
end
