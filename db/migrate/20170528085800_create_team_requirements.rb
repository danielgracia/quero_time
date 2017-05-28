class CreateTeamRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :team_requirements do |t|
      t.belongs_to :skill, foreign_key: true
      t.belongs_to :skill_level, foreign_key: true

      t.timestamps
    end
  end
end
