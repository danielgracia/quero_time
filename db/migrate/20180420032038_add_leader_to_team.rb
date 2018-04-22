class AddLeaderToTeam < ActiveRecord::Migration[5.1]
  def change
    add_reference :teams, :leader, index: true
    add_foreign_key :teams, :users, column: :leader_id
  end
end
