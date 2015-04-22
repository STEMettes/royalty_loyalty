class AddQ1ColumnToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :Q1, :string
  end
end
