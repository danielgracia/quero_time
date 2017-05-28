class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :invite]
  before_action :check_user, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user_skill = UserSkill.new
  end

  # GET /users/1/edit
  def edit
  end

  # GET /users/1/invite
  # POST /users/1/invite
  def invite
    if request.post?
      ApplicationRecord.transaction do
        @invitation = Invitation.new(invitation_params.merge(user_id: params[:id]))

        if @invitation.save
          Slack::Invitation.post!(current_user, @invitation) if Rails.env.production?

          redirect_to users_path, notice: 'Convite criado com sucesso.'
        else
          render :invite
        end
      end
    else
      @invitation = Invitation.new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Perfil atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :information, :active)
    end

    def invitation_params
      params.require(:invitation).permit(:team_id)
    end

    def check_user
      redirect_to users_path, notice: 'Não pode alterar outros usuários' unless current_user == @user
    end
end
