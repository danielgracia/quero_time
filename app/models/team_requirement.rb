class TeamRequirement < ApplicationRecord
  belongs_to :team
  belongs_to :skill
  belongs_to :skill_level
end
