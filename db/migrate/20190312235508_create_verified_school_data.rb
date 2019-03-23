class CreateVerifiedSchoolData < ActiveRecord::Migration[5.2]
  def change
    create_table :verified_school_data do |t|
      t.integer :school_detail_id # school id or school detail id ?? not confirm yet
      t.integer :user_id
      t.date :verifed_date

      t.timestamps
    end
  end
end
