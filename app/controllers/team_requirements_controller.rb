class TeamRequirementsController < ApplicationController
  before_action :set_team_requirement, only: [:show, :edit, :update, :destroy]

  # GET /team_requirements
  # GET /team_requirements.json
  def index
    @team_requirements = TeamRequirement.all
  end

  # GET /team_requirements/1
  # GET /team_requirements/1.json
  def show
  end

  # GET /team_requirements/new
  def new
    @team_requirement = TeamRequirement.new
  end

  # GET /team_requirements/1/edit
  def edit
  end

  # POST /team_requirements
  # POST /team_requirements.json
  def create
    @team_requirement = TeamRequirement.new(team_requirement_params)

    respond_to do |format|
      if @team_requirement.save
        team = @current_user.teams.first
        format.html { redirect_to team, notice: 'Habilidade criada com sucesso.' }
        format.json { render :show, status: :created, location: @team_requirement }
      else
        format.html { render :new }
        format.json { render json: @team_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_requirements/1
  # PATCH/PUT /team_requirements/1.json
  def update
    respond_to do |format|
      if @team_requirement.update(team_requirement_params)
        team = @current_user.teams.first
        format.html { redirect_to team, notice: 'Requisito de habilidadeatualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @team_requirement }
      else
        format.html { render :edit }
        format.json { render json: @team_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_requirements/1
  # DELETE /team_requirements/1.json
  def destroy
    @team_requirement.destroy
    respond_to do |format|
      teams = @current_user.teams.first
      format.html { redirect_to teams, notice: 'Requisito de habilidade removido com sucecsso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_requirement
      @team_requirement = TeamRequirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_requirement_params
      params.require(:team_requirement).permit(:count, :skill_id, :skill_level_id, :team_id)
    end
end
