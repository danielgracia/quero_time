module ApplicationHelper

  def is_current_user?(user)
    current_user == user
  end

  def link_user(user, css_class: "")
    if user.present?
      link_to(user.name, user, class: css_class)
    else
      "Não possui"
    end
  end

  def link_team(team)
    if team.present?
      link_to(team.name, team)
    else
      "Não possui time"
    end
  end

  def is_member_of_team?(team)
    current_user.team == team
  end

  def can_edit_project?(project)
    is_responsible?(project) || is_owner?(project)
  end

  def is_responsible?(project)
    project.team.present? && project.team == current_user.team
  end

  def is_owner?(project)
    project.team.nil? && is_current_user?(project.user)
  end

end
