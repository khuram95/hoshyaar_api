class CreateOtpcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :otpcodes do |t|
      t.string :otp_code
      t.string :expire_at
      t.integer :user_id

      t.timestamps
    end
  end
end
