class Team < ApplicationRecord
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams

  def leader
    users.references(:user_teams).where(user_teams: {leader: true}).first
  end
end
