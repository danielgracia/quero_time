class AddUserTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :user_teams do |t|
      t.references :user, type: :string, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.boolean :leader

      t.timestamps
    end
  end
end
