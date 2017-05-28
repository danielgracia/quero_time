class Skill < ApplicationRecord
  has_many :user_skills
  has_many :users, through: :user_skills
  has_many :team_requirements
  has_many :teams, through: :team_requirements
end
