class AddCountyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :county, :string
  end
end
