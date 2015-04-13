class AddEventReferenceToSurveys < ActiveRecord::Migration
  def change
        add_reference :surveys, :event
  end
end
