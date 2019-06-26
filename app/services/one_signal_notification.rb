
class OneSignalNotification
  attr_accessor :notification_data, :user, :type
  def initialize(notification_data, user,type)
    @notification_data = notification_data
    @user = user
    @type = type
  end

  def call
    now = DateTime.now.utc
    notification = user.notifications.new(notification_text: notification_data[:notification_text],
                                          report_id: notification_data[:report_id],
                                          report_time: now.in_time_zone('Asia/Karachi'))
    if notification.save && user.device_ids.present?
      OneSignal::OneSignal.api_key = ENV['ONE_SIGNAL_API_KEY']
      type == 'report' ?
        OneSignal::Notification.create(params: report_notification_params)
      : OneSignal::Notification.create(params: comment_notification_params)
    end
  end

  private

  def report_notification_params
    {
      app_id: ENV['ONE_SIGNAL_APP_ID'],
      headings: { en: 'New Report Created' },
      contents: {
        en: notification_data[:notification_text]
      },
      include_player_ids: user.device_ids,
    }
  end
  def comment_notification_params
    {
      app_id: ENV['ONE_SIGNAL_APP_ID'],
      headings: { en: 'New Comment' },
      contents: {
        en: notification_data[:notification_text]
      },
      include_player_ids: user.device_ids,
    }
  end
end
