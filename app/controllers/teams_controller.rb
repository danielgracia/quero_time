class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update]
  before_action :check_team, only: [:new, :create]
  before_action :check_own_team, only: [:edit, :update]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team, success = current_user.create_team(team_params)

    respond_to do |format|
      if success
        format.html { redirect_to @team, notice: 'Equipe criada com sucesso.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Equipe atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :information, :active, :observations)
    end

    def check_team
      redirect_to teams_path, notice: 'Você já possuí um time' if current_user.team
    end

    def check_own_team
      redirect_to teams_path, notice: 'Esse não é seu time' if current_user.team != @team
    end
end
