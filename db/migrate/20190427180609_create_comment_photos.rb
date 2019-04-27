class CreateCommentPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_photos do |t|
      t.string :image
      t.integer :comment_id

      t.timestamps
    end
  end
end
