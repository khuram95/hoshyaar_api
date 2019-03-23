class CreateSchoolDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :school_details do |t|
      t.integer :total_class_rooms
      t.integer :use_class_rooms
      t.integer :total_teacher
      t.integer :non_teacher
      t.integer :toilet_avaliable
      t.integer :toilet_functional
      t.boolean :is_toilet_functional
      t.integer :student_enrolled
      t.integer :student_present
      t.boolean :is_electricity_avaliable
      t.boolean :is_drinking_water_avaliable
      t.boolean :is_boundary_wall
      t.float :avaliable_fund
      t.float :expenditure
      t.float :balance
      t.integer :school_id

      t.timestamps
    end
  end
end
