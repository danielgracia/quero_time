class RemoveSkillLevel < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_skills, :skill_level_id
    remove_column :team_requirements, :skill_level_id
    drop_table :skill_levels
  end
end
