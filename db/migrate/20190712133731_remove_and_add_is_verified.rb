class RemoveAndAddIsVerified < ActiveRecord::Migration[5.2]
  def change
    remove_column :reports, :is_removed
    add_column :reports, :is_removed, :boolean, default: false
  end
end
