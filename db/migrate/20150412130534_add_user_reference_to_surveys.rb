class AddUserReferenceToSurveys < ActiveRecord::Migration
  def change
    add_reference :surveys, :user
  end
end
