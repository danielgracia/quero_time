class AddObservationToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :observations, :text
  end
end
