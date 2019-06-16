class ChangeDataTypeOfSchoolIdToSchoolDetail < ActiveRecord::Migration[5.2]
  def change
    def self.up
      change_column :school_details, :school_id, :string
    end

    def self.down
      change_column :school_details, :school_id, :integer
    end
  end
end
