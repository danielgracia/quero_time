json.extract! invitation, :id, :state, :users_id, :teams_id, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
