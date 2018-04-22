class Team < ApplicationRecord
  has_many :users
  has_one :project
  has_one :leader, class_name: "User"

  scope :active, -> { where("COALESCE(teams.active, 1)") }

  def full_team
    self.users.count >= 4
  end

  def change_team_leader
    if self.users.empty?
      self.active = false
      self.save
    elsif !self.users.include?(self.leader)
      self.leader = self.users.sample
      self.save
    end
  end

end
