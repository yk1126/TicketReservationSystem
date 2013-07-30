class AddTimeToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :flight_time, :string
  end
end
