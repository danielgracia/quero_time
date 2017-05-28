class AddColumnToTeamRequirements < ActiveRecord::Migration[5.1]
  def change
    add_reference :team_requirements, :team, index: true, foreign_key: true
  end
end
