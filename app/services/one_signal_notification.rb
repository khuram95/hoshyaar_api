
class OneSignalNotification
  attr_accessor :notification_data, :user
  def initialize(notification_data, user)
    @notification_data = notification_data
    @user = user
  end

  def call
    notification = user.notifications.new(notification_text: notification_data[:notification_text],report_id: notification_data[:report_id])
    if notification.save && user.device_ids.present?
      OneSignal::OneSignal.api_key = ENV['ONE_SIGNAL_API_KEY']
      OneSignal::Notification.create(params: android_notification_params)
    end
  end

  private

  def android_notification_params
    {
      app_id: ENV['ONE_SIGNAL_APP_ID'],
      headings: { en: 'new_report_created' },
      contents: {
        en: notification_data[:notification_text]
      },
      include_player_ids: user.device_ids,
    }
  end
end
