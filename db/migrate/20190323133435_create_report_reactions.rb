class CreateReportReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :report_reactions do |t|
      t.integer :report_id
      t.boolean :is_agree

      t.timestamps
    end
  end
end
