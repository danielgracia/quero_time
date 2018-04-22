class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :team

  STATE = {
    "WAITING" => "Aguardando resposta",
    "ACCEPT" => "Convite aceito",
    "REFUSE" => "Convite recusado"
  }

  def accept
    self.state = "ACCEPT"
    self.save
  end

  def refuse
    self.state = "REFUSE"
    self.save
  end

end
