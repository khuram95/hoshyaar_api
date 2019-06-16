class AddCreatedAtToNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :report_time, :datetime
  end
end