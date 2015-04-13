class AddSurveyTypeToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :survey_type, :string
  end
end
