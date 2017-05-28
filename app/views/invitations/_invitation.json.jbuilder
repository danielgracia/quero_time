json.extract! invitation, :id, :state, :user_id, :teams_id, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
