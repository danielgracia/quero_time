class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_user
  helper_method :current_user, :login_path

  def current_user
    return @current_user if @current_user

    @current_user = User.find_by(id: session[:current_user_id])
  end

  def current_user=(user)
    session[:current_user_id] = user.id
    @current_user = user
  end

  def forget_user
    @current_user = nil
    session.delete(:current_user_id)
  end

  def check_user
    redirect_to welcome_path unless current_user
  end

  if Rails.env.production?
    def login_path; '/auth/slack'; end
    def permissions_path; '/auth/slack_permissions'; end
  else
    def login_path; '/auth/developer'; end
    def permissions_path; root_path; end
  end

end
