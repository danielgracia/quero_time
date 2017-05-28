class Team < ApplicationRecord
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams

  scope :active, -> { where("COALESCE(teams.active, 1)") }

  def leader
    users.references(:user_teams).where(user_teams: {leader: true}).first
  end
end
