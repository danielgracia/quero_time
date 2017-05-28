class CreateUserSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :user_skills do |t|
      t.integer :level
      t.belongs_to :users, foreign_key: true
      t.belongs_to :skills, foreign_key: true

      t.timestamps
    end
  end
end
