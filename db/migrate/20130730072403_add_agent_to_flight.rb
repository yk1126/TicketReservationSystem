class AddAgentToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :travel_agent, :string
  end
end
