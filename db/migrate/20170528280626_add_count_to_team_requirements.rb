class AddCountToTeamRequirements < ActiveRecord::Migration[5.1]
  def change
    add_column :team_requirements, :count, :integer
  end
end
