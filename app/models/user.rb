class User < ApplicationRecord
  belongs_to :team, optional: true

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

  def create_team(team_params)
    transaction do
      team = Team.new(team_params)
      team.leader = self
      if team.save
        self.team = team
        self.save
        return team, true
      else
        return team, false
      end
    end
  end

  def accept_invitation(invitation)
    transaction do
      self.team = invitation.team
      if self.save
        invitation.accept
        return true
      else
        return false
      end
    end
  end
end
