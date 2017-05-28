require 'test_helper'

class TeamRequirementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_requirement = team_requirements(:one)
  end

  test "should get index" do
    get team_requirements_url
    assert_response :success
  end

  test "should get new" do
    get new_team_requirement_url
    assert_response :success
  end

  test "should create team_requirement" do
    assert_difference('TeamRequirement.count') do
      post team_requirements_url, params: { team_requirement: { skill_id: @team_requirement.skill_id, skill_level_id: @team_requirement.skill_level_id } }
    end

    assert_redirected_to team_requirement_url(TeamRequirement.last)
  end

  test "should show team_requirement" do
    get team_requirement_url(@team_requirement)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_requirement_url(@team_requirement)
    assert_response :success
  end

  test "should update team_requirement" do
    patch team_requirement_url(@team_requirement), params: { team_requirement: { skill_id: @team_requirement.skill_id, skill_level_id: @team_requirement.skill_level_id } }
    assert_redirected_to team_requirement_url(@team_requirement)
  end

  test "should destroy team_requirement" do
    assert_difference('TeamRequirement.count', -1) do
      delete team_requirement_url(@team_requirement)
    end

    assert_redirected_to team_requirements_url
  end
end
