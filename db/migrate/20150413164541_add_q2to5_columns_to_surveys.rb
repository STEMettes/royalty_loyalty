class AddQ2to5ColumnsToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :Q2, :string
    add_column :surveys, :Q3, :string
    add_column :surveys, :Q4, :string
    add_column :surveys, :Q5, :string
  end
end
