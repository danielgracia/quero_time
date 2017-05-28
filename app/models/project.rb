class Project < ApplicationRecord
  belongs_to :team, optional: true
  belongs_to :user
end
