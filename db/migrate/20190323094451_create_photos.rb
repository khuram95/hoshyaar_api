class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :report_id
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
