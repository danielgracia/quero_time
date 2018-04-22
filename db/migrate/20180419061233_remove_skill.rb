class RemoveSkill < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_skills, :skill_id
    remove_column :team_requirements, :skill_id
    drop_table :skills
  end
end
