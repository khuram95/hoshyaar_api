class CreateMyInterest < ActiveRecord::Migration[5.2]
  def change
    create_table :my_interests do |t|
      t.integer :user_id
      t.integer :school_id
    end
  end
end
