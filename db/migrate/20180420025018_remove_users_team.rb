class RemoveUsersTeam < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_teams
  end
end
