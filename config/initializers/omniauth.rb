Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :slack, '2154556232.188966132563', '7449fbdf6ff86989a05c615d2d284d5e',
      scope: 'identity.basic,identity.avatar,identity.email,identity.team',
      team: 'T024JGC6U' # Quero Educação team ID

    provider :slack, '2154556232.188966132563', '7449fbdf6ff86989a05c615d2d284d5e',
      scope: 'chat:write:bot,im:write', team: 'T024JGC6U',
      name: 'slack_permissions' # Different endpoint for getting user permissions
  else
    provider :developer,
      fields: [:name, :email, :fake_id],
      uid_field: :fake_id
  end
end

OmniAuth.config.full_host = "http://162.243.69.190"
OmniAuth.config.logger = Rails.logger
