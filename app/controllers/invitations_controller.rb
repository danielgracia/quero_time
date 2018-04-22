class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy, :accept]

  # GET /invitations
  # GET /invitations.json
  def index
    @invitations = Invitation.where(user: current_user)
  end

  # GET /invitations/1
  # GET /invitations/1.json
  def show
  end

  # POST /invitations/1/accept
  def accept
    if current_user != @invitation.user
      redirect_to invitations_path, notice: "Eita amigo, este convite não é para você."
    else
      if current_user.accept_invitation(@invitation)
        redirect_to teams_path, notice: "Você aceitou o convite para a equipe #{@invitation.team.name}!"
      else
        redirect_to teams_path, notice: "Ocorreu um erro ao tentar entrar na equipe #{@invitation.team.name}!"
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.json
  def destroy
    @invitation.refuse
    respond_to do |format|
      format.html { redirect_to invitations_url, notice: 'Convite foi deletado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invitation_params
      params.require(:invitation).permit(:state, :user_id, :team_id)
    end
end
