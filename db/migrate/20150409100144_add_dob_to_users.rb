class AddDobToUsers < ActiveRecord::Migration
  def change
    add_column :users, :DOB, :date
  end
end
