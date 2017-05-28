class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, :check_user

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to permissions_path
  end

  def update
    self.current_user.update(oauth_token: auth_hash[:credentials][:token])
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
