class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return @current_user if @current_user

    @current_user = session[:current_user_id].try do |id|
      User.find(id)
    end
  end

  def current_user=(user)
    session[:current_user_id] = user.slack_id
    @current_user = user
  end

  def forget_user
    @current_user = nil
    session.delete(:current_user_id)
  end


end
