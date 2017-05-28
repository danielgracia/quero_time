class HomeController < ApplicationController
  skip_before_action :check_user, only: :welcome

  def index
  end

  def welcome
    redirect_to root_path and return if current_user

    render layout: "minimal.html.erb"
  end
end
