class CreateSkillLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_levels do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

  end
end
