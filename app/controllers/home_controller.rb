class HomeController < ApplicationController
  skip_before_action :check_user, only: :welcome

  def index
    if current_user.teams.blank?
      redirect_to teams_path
    elsif current_user.teams.first.full_team
      redirect_to projects_path
    else
      redirect_to users_path
    end
  end

  def welcome
    redirect_to root_path and return if current_user

    render layout: "minimal.html.erb"
  end
end
