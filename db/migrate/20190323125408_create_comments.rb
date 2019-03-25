class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :text
      t.string :image
      t.string :voice_message
      t.string :video
      t.integer :report_id
 
      t.timestamps
    end
  end
end
