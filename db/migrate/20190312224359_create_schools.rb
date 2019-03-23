class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.date :visting_date
      t.string :emis
      t.string :school_name
      t.string :district
      t.string :tehsil
      t.string :markaz
      t.string :school_level
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
