class CreateOptcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :optcodes do |t|
      t.string :opt_code
      t.string :expire_at
      t.integer :user_id

      t.timestamps
    end
  end
end
