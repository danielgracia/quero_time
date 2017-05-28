class User < ApplicationRecord
  self.primary_key = :slack_id

  def self.find_or_create_from_auth_hash(auth_hash)
    uid = auth_hash[:uid]
    raise if uid.blank?

    User.find_or_initialize_by(slack_id: uid).tap do |u|
      u.update!({
        name: auth_hash[:info][:name],
        email: auth_hash[:info][:email],
        avatar: auth_hash[:info][:image_48],
        oauth_token: auth_hash[:credentials][:token]
      })
    end
  end
end
