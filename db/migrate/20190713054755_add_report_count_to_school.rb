class AddReportCountToSchool < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :report_count, :integer, :null => false, :default => 0

    School.all.each do |p|
      p.update_attribute :report_count, p.reports.length
    end
  end
end
