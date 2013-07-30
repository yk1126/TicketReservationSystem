class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :travel_from
      t.string :travel_to
      t.string :travel_date

      t.timestamps
    end
  end
end
