class CreateUserSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :user_skills do |t|
      t.integer :level
      t.belongs_to :user, type: :string, index: true, foreign_key: true
      t.belongs_to :skill, index: true, foreign_key: true

      t.timestamps
    end
  end
end
