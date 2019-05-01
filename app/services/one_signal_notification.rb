
class OneSignalNotification
  attr_accessor :notification_data, :user

  def initialize(notification_data, user)
    @notification_data = notification_data
    @user = user
  end

  def call
    notification = user.notifications.new(data: notification_data)
    if notification.save && user.device_ids.present?
      OneSignal::OneSignal.api_key = ENV['ONE_SIGNAL_API_KEY']
      OneSignal::Notification.create(params: android_notification_params)
    end
  end

  private

  def android_notification_params
    {
      app_id: ENV['ONE_SIGNAL_APP_ID'],
      headings: { en: notification_data[:type].capitalize.tr!('_', ' ') },
      contents: {
        en: notification_data[:description]
      },
      include_player_ids: user.device_ids,
    }
  end
end
