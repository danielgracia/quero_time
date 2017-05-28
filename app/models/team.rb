class Team < ApplicationRecord
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams
  has_one :project
  has_many :team_requirements
  has_many :skills, through: :team_requirements

  scope :active, -> { where("COALESCE(teams.active, 1)") }

  def leader
    users.references(:user_teams).where(user_teams: {leader: true}).first
  end
end
