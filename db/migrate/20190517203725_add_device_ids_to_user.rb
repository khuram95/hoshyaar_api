class AddDeviceIdsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :device_ids, :jsonb, default: []
  end
end