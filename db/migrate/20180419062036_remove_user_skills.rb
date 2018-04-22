class RemoveUserSkills < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_skills
  end
end
