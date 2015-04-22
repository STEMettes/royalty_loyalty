class AddCompletedToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :completed, :boolean, :default => false
  end
end
