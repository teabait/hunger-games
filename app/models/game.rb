class Game < ActiveRecord::Base
  def reap
    tribute = (Citizen.all).first
    Tribute.create(citizen_id: tribute.id)
  end
end