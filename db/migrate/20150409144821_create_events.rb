class CreateEvents < ActiveRecord::Migration

  # devise :timeoutable
  # :timeout_in => 30.seconds
  # event.timedout?()

  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :location
      t.string :code

      t.timestamps null: false
    end
  end

  # def timeout_in
  #   if self.admin?
  #     20.seconds
  #   else
  #     2
  #   end
  # end




end
