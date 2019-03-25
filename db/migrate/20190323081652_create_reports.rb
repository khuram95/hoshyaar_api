class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :authencity
      t.integer :user_id
      t.string :report_date
      t.string :report_text
      t.string :removed_date
      t.string :is_removed
      t.float :longitude
      t.float :latitude
      t.integer :removed_by
      t.integer :school_id
      t.string :video
      t.string :voice_message

      t.timestamps
    end
  end
end
