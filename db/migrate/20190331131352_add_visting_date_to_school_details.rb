class AddVistingDateToSchoolDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :school_details, :visiting_date, :string
  end
end
