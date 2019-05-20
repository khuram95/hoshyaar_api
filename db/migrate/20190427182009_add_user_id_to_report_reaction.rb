class AddUserIdToReportReaction < ActiveRecord::Migration[5.2]
  def change
    add_column :report_reactions, :user_id, :integer
  end
end
