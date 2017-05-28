class User < ApplicationRecord
  has_many :user_teams, dependent: :destroy
  has_many :teams, through: :user_teams
  has_many :user_skills
  has_many :skills, through: :user_skills

  def self.find_or_create_from_auth_hash(auth_hash)
    uid = auth_hash[:uid]
    raise if uid.blank?

    User.find_or_initialize_by(id: uid).tap do |u|
      u.update!({
        name: auth_hash[:info][:name],
        email: auth_hash[:info][:email],
        avatar: auth_hash[:info][:image_48]
      })
    end
  end

  def user_id
    id.split('-').first
  end

  def team
    teams.active.last
  end

  def associate_team(team)
    transaction do
      self.teams.clear
      self.teams << team
    end
  end

  def create_team(team_params)
    transaction do
      team = Team.new(team_params)

      if team.save
        UserTeam.create!(user: self, team: team, leader: true)

        return team, true
      else
        return team, false
      end
    end
  end
end
