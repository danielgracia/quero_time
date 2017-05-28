class User < ApplicationRecord
  has_many :teams, through: :user_teams

  def self.find_or_create_from_auth_hash(auth_hash)
    uid = auth_hash[:uid]
    raise if uid.blank?

    User.find_or_initialize_by(id: uid).tap do |u|
      u.update!({
        name: auth_hash[:info][:name],
        email: auth_hash[:info][:email],
        avatar: auth_hash[:info][:image_48],
        oauth_token: auth_hash[:credentials][:token]
      })
    end
  end

  def create_team(team_params)
    team = Team.create!(team_params)
    association = UserTeam.create!(user: self, team: team, leader: true)
    self.reload
  end
end
