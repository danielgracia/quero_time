class RemoveTeamRequirements < ActiveRecord::Migration[5.1]
  def change
    drop_table :team_requirements
  end
end
