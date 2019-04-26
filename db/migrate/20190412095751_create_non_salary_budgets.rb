class CreateNonSalaryBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :non_salary_budgets do |t|
      t.string :school_id
      t.integer :current_year_expenture
      t.integer :balance
      t.integer :total_funds_available
    end
  end
end
